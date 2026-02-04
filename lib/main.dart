import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'data/datasources/headquarters_dao.dart';
import 'data/repositories/headquarters_repository_impl.dart';
import 'presentation/controllers/headquarters_controller.dart';
import 'domain/usecases/headquarters/create_headquart.dart';
import 'domain/usecases/headquarters/get_headquart.dart';
import 'presentation/controllers/user_controller.dart';
import '../domain/usecases/users/create_user.dart';
import 'data/repositories/user_repository_impl.dart';
import 'data/datasources/user_dao.dart';
import 'presentation/controllers/login_controller.dart';
import 'domain/usecases/users/login_user.dart';
import 'app/app.dart';
import 'core/theme/theme_provider.dart';
import 'data/db/database.dart';

// Multiprovider
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar SQLite FFI (Windows)
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final db = await DatabaseConnection.getDatabase();

  // configuraciones de DAO y Repositorio para Headquarters (carga de datos)
  final headquartersDao = HeadquartersDao(db);
  final headquartersRepository = HeadquartersRepositoryImpl(headquartersDao);
  final createHeadquart = CreateHeadquart(headquartersRepository);
  final getHeadquart = GetHeadquart(headquartersRepository);
  // configuraciones de DAO y Repositorio para Users (carga de datos)
  final userDao = UserDao(db);
  final userRepository = UserRepositoryImpl(userDao);
  final createUser = CreateUser(userRepository, headquartersRepository);

  final loginUser = LoginUser(userRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => HeadquartersController(
            createHeadquart,
            headquartersRepository,
            getHeadquart,
          )..loadHeadquarters(), // Carga inicial de datos para Headquarters
        ),
        ChangeNotifierProvider(
          create: (_) =>
              UserController(createUser, userRepository)..loadUsers(),
        ),
        ChangeNotifierProvider(create: (_) => LoginController(loginUser)),
      ],
      child: const App(),
    ),
  );
}
