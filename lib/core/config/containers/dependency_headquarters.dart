import '../db/database.dart';
import '../../../data/datasources/headquarters_dao.dart';
import '../../../data/repositories_impl/headquarters_repository_impl.dart';

import '../db/app_database_provider.dart'; // instancia unica de la db 

import '../../../domain/usecases/headquarters/create_headquarter.dart';
import '../../../domain/usecases/headquarters/delete_headquarter.dart';
import '../../../domain/usecases/headquarters/get_all_headquarters.dart';
import '../../../domain/usecases/headquarters/update_headquarter.dart';
import '../../../domain/usecases/headquarters/find_headquarters.dart';
import '../../../domain/usecases/headquarters/watch_headquarters.dart';
import '../../../domain/usecases/headquarters/get_headquarter_by_id.dart';

class InjectionHeadquarters {
  static final InjectionHeadquarters _instance =
      InjectionHeadquarters._internal();

  factory InjectionHeadquarters() => _instance;

  InjectionHeadquarters._internal();

  late AppDatabase _database;

  AppDatabase get database => _database;

  //DAOS
  late HeadquartersDao _headquartersDao;

  //Repositorios
  late HeadquartersRepositoryImpl _headquartersRepository;

  // Usecases
  late CreateHeadquarter _createHeadquarter;
  late UpdateHeadquarter _updateHeadquarter;
  late DeleteHeadquarter _deleteHeadquarter;
  late GetAllHeadquarters _getAllHeadquarters;
  late GetHeadquarterById _getHeadquarterById;
  late FindHeadquarters _findHeadquarters;
  late WatchHeadquarters _watchHeadquarters;

  //Gettters
  CreateHeadquarter get createHeadquarter => _createHeadquarter;
  UpdateHeadquarter get updateHeadquarter => _updateHeadquarter;
  DeleteHeadquarter get deleteHeadquarter => _deleteHeadquarter;
  GetAllHeadquarters get getAllHeadquarters => _getAllHeadquarters;
  GetHeadquarterById get getHeadquarterById => _getHeadquarterById;
  FindHeadquarters get findHeadquarters => _findHeadquarters;
  WatchHeadquarters get watchHeadquarters => _watchHeadquarters;

  static bool initialized = false;

  static Future<void> init() async {
    if (initialized) return;

    final container = InjectionHeadquarters();
    // Drift maneja internamente la creación de la base de datos;
    // solo necesitamos instanciar nuestra clase.
    container._database = AppDatabaseProvider.instance;

    // DAO
    container._headquartersDao = HeadquartersDao(container._database);

    // REPOSITORY
    container._headquartersRepository = HeadquartersRepositoryImpl(
      container._headquartersDao,
    );

    // USECASES
    container._createHeadquarter = CreateHeadquarter(
      container._headquartersRepository,
    );

    container._updateHeadquarter = UpdateHeadquarter(
      container._headquartersRepository,
    );

    container._deleteHeadquarter = DeleteHeadquarter(
      container._headquartersRepository,
    );

    container._getAllHeadquarters = GetAllHeadquarters(
      container._headquartersRepository,
    );

    container._getHeadquarterById = GetHeadquarterById(
      container._headquartersRepository,
    );

    container._findHeadquarters = FindHeadquarters(
      container._headquartersRepository,
    );

    container._watchHeadquarters = WatchHeadquarters(
      container._headquartersRepository,
    );

    initialized = true;
  }
}
