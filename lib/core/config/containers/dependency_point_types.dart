import '../../../domain/repositories/point_types_repository.dart';
import '../../../data/repositories_impl/point_types_repository_impl.dart';
import '../db/app_database_provider.dart';
import '../../../domain/usecases/point_types/get_all_point_types.dart';

class InjectionPointTypes {
  static final InjectionPointTypes _instance = InjectionPointTypes._internal();
  factory InjectionPointTypes() => _instance;
  InjectionPointTypes._internal();

  PointTypesRepository? _pointTypesRepository;

  PointTypesRepository get pointTypesRepository {
    return _pointTypesRepository ??= PointTypesRepositoryImpl(
      AppDatabaseProvider.instance, 
    );
  }

  GetAllPointTypes get getAllPointTypes => GetAllPointTypes(pointTypesRepository);
}
