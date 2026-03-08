import '../db/database.dart';
import '../../../data/datasources/headquarters_dao.dart';
import '../../../data/repositories/headquarters_repository_impl.dart';
import '../../../domain/usecases/headquarters/create_headquart.dart';
import '../../../domain/usecases/headquarters/delete_headquart.dart';
import '../../../domain/usecases/headquarters/get_headquart.dart';
import '../../../domain/usecases/headquarters/update_headquart.dart';

class InjectionHeadquart {
  static final InjectionHeadquart _instancia = InjectionHeadquart._internal();
  factory InjectionHeadquart() => _instancia;
  InjectionHeadquart._internal();

  late AppDatabase _database;
  AppDatabase get database => _database;
  //DAOS
  late HeadquartersDao _headquartersDao;

  //Repositorios
  late HeadquartersRepositoryImpl _headquartersRepository;

  // Usecase
  late CreateHeadquart _createHeadqueart;
  late GetHeadquart _getHeadquart;
  late DeleteHeadquart _deleteHeadquart;
  late UpdateHeadquart _updateHeadquart;

  //Gettters
  HeadquartersDao get headquarterDao => _headquartersDao;
  HeadquartersRepositoryImpl get headquartersRepository =>
      _headquartersRepository;

  CreateHeadquart get createHeadquart => _createHeadqueart;
  GetHeadquart get getHeadquart => _getHeadquart;
  DeleteHeadquart get deleteHeadquart => _deleteHeadquart;
  UpdateHeadquart get updateHeadquart => _updateHeadquart;

  static Future<void> init() async {
    final container = InjectionHeadquart();
    // Drift maneja internamente la creación de la base de datos;
    // solo necesitamos instanciar nuestra clase.
    container._database = AppDatabase();

    container._headquartersDao = HeadquartersDao(container._database);

    container._headquartersRepository = HeadquartersRepositoryImpl(
      container._headquartersDao,
    );

    container._createHeadqueart = CreateHeadquart(
      container.headquartersRepository,
    );

    container._getHeadquart = GetHeadquart(container._headquartersRepository);

    container._deleteHeadquart = DeleteHeadquart(
      container._headquartersRepository,
    );

    container._updateHeadquart = UpdateHeadquart(
      container._headquartersRepository,
    );
  }
}
