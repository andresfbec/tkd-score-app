import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'data/datasources/headquarters_dao.dart';
import 'data/repositories/headquarters_repository_impl.dart';
import 'presentation/controllers/headquarters_controller.dart';

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

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HeadquartersController(headquartersRepository)
          ..loadHeadquarters(), // Carga inicial de datos para Headquarters
        ),
      ],
      child: const App(),
    ),
  );
}
