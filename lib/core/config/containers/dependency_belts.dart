import '../../../domain/repositories/belts_repository.dart';
import '../../../data/repositories_impl/belts_repository_impl.dart';
import '../db/database.dart';
import '../db/app_database_provider.dart';
import '../../../data/repositories_impl/belts_repository_impl.dart';

// En tu archivo de inyección de estudiantes o uno nuevo llamado InjectionBelts:
class InjectionBelts {
  static final InjectionBelts _instance = InjectionBelts._internal();
  factory InjectionBelts() => _instance;
  InjectionBelts._internal();

  BeltsRepository? _beltsRepository;

  BeltsRepository get beltsRepository {
    // Aquí está el cambio: Pasamos directamente la base de datos
    // ya que el RepoImpl no usa DAO, usa 'db' directamente.
    return _beltsRepository ??= BeltsRepositoryImpl(
      AppDatabaseProvider.instance, 
    );
  }
}
