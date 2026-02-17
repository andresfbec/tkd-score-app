import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../data/datasources/user_dao.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../data/repositories/headquarters_repository_impl.dart';
import '../../data/datasources/headquarters_dao.dart';
import '../../domain/usecases/users/create_user.dart';
import '../../domain/usecases/users/delete_user.dart';
import '../../domain/usecases/users/get_user.dart';
import '../../domain/usecases/users/update_user.dart';
import '../../domain/usecases/users/update_password.dart';
import '../../domain/usecases/users/login_user.dart';
import '../../data/db/database.dart';

class InjectionUser {
  static final InjectionUser _instancia = InjectionUser._internal();
  factory InjectionUser() => _instancia;
  InjectionUser._internal();

  late Database _database;
  Database get database => _database;
  //DAOS
  late UserDao _userDao;
  late HeadquartersDao _headquartersDao;

  //Repositorios
  late UserRepositoryImpl _userRepository;
  late HeadquartersRepositoryImpl _headquartersRepository;

  //Usecase
  late CreateUser _createUser;
  late GetUser _getUser;
  late DeleteUser _deleteUser;
  late UpdateUser _updateUser;
  late NewPassword _updatePassword;
  late LoginUser _loginUser;

  //Gettters
  UserDao get userDao => _userDao;

  UserRepositoryImpl get userRepository => _userRepository;
  HeadquartersRepositoryImpl get headquartersRepository =>
      _headquartersRepository;

  CreateUser get createUser => _createUser;
  GetUser get getUser => _getUser;
  DeleteUser get deleteUser => _deleteUser;
  UpdateUser get updateUser => _updateUser;
  NewPassword get updatePassword => _updatePassword;
  LoginUser get loginUser => _loginUser;

  static Future<void> init() async {
    final container = InjectionUser();

    // configure FFI and database factory (required by sqflite_common_ffi)
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    // 🔹 Inicializar conexión a base de datos
    container._database = await DatabaseConnection.getDatabase();

    // DAOS
    container._userDao = UserDao(container._database);
    // headquarters DAO needed for user usecases
    container._headquartersDao = HeadquartersDao(container._database);

    // Repositorios
    container._userRepository = UserRepositoryImpl(container._userDao);
    container._headquartersRepository = HeadquartersRepositoryImpl(
      container._headquartersDao,
    );

    // Usecases
    container._createUser = CreateUser(
      container.userRepository,
      container.headquartersRepository,
    );

    container._getUser = GetUser(container._userRepository);

    container._deleteUser = DeleteUser(container._userRepository);

    container._updateUser = UpdateUser(
      container._userRepository,
      container.headquartersRepository,
    );

    container._updatePassword = NewPassword(container._userRepository);

    container._loginUser = LoginUser(container._userRepository);
  }
}
