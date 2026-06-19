import '../../../domain/repositories/belts_repository.dart';
import '../../../data/repositories_impl/belts_repository_impl.dart';
import '../db/app_database_provider.dart';
import '../../../domain/usecases/belts/get_all_belts.dart';

class InjectionBelts {
  static final InjectionBelts _instance = InjectionBelts._internal();
  factory InjectionBelts() => _instance;
  InjectionBelts._internal();

  BeltsRepository? _beltsRepository;

  BeltsRepository get beltsRepository {
    return _beltsRepository ??= BeltsRepositoryImpl(
      AppDatabaseProvider.instance, 
    );
  }

  GetAllBelts get getAllBelts => GetAllBelts(beltsRepository);
}
