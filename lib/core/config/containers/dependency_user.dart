import '../db/database.dart';
import '../../../data/datasources/users_dao.dart';
import '../../../data/repositories_impl/users_repository_impl.dart';
import '../../../data/repositories_impl/headquarters_repository_impl.dart';
import '../../../data/datasources/headquarters_dao.dart';
import '../../../domain/usecases/users/create_user.dart';
import '../../../domain/usecases/users/delete_user.dart';
import '../../../domain/usecases/users/get_user.dart';
import '../../../domain/usecases/users/update_user.dart';
import '../../../domain/usecases/users/update_password.dart';
import '../../../domain/usecases/users/login_user.dart';
import '../../../presentation/controllers/session_controller.dart';

import '../db/app_database_provider.dart';

class InjectionUser {
  static final InjectionUser _instancia = InjectionUser._internal();
  factory InjectionUser() => _instancia;
  InjectionUser._internal();

  late AppDatabase _database;
  AppDatabase get database => _database;
  //DAOS
  late UserDao _userDao;
  late HeadquartersDao _headquartersDao;

  //
  late SessionController _sessionController;
  SessionController get sessionController => _sessionController;
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

  static bool initialized = false;

  static Future<void> init() async {
    if (initialized) return;

    final container = InjectionUser();

    // Drift no necesita configuración externa, simplemente instanciamos
    container._database = AppDatabaseProvider.instance;

    // DAOS
    container._userDao = UserDao(container._database);
    // headquarters DAO needed for user usecases
    container._headquartersDao = HeadquartersDao(container._database);
    // SessionController
    container._sessionController = SessionController();

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

    initialized = true;
  }
}
