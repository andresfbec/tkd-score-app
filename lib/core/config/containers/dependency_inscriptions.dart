import '../db/database.dart';
import '../db/app_database_provider.dart';

// DAOs y Repos Impl
import '../../../data/datasources/inscriptions_dao.dart';
import '../../../data/repositories_impl/inscriptions_repository_impl.dart';

// Repositorios de apoyo (Inyectados desde sus propios Injection)
import 'dependency_students.dart';
import 'dependency_tournament.dart';

// Use Cases
import '../../../domain/usecases/inscriptions/create_inscription.dart';
import '../../../domain/usecases/inscriptions/update_inscription.dart';
import '../../../domain/usecases/inscriptions/delete_inscription.dart';
import '../../../domain/usecases/inscriptions/watch_inscriptions.dart';
import '../../../domain/usecases/inscriptions/get_inscriptions_by_tournament.dart';

class InjectionInscriptions {
  static final InjectionInscriptions _instance = InjectionInscriptions._internal();
  factory InjectionInscriptions() => _instance;
  InjectionInscriptions._internal();

  InscriptionsRepositoryImpl? _repository;

  InscriptionsRepositoryImpl get inscriptionsRepository {
    return _repository ??= InscriptionsRepositoryImpl(
      inscriptionsDao: InscriptionsDao(AppDatabaseProvider.instance),
    );
  }

  // Use Cases
  CreateInscription get createInscription => CreateInscription(
        inscriptionsRepository,
        InjectionStudents().studentsRepository,
        InjectionTournament().tournamentRepository,
      );

  UpdateInscription get updateInscription => UpdateInscription(inscriptionsRepository);

  DeleteInscription get deleteInscription => DeleteInscription(inscriptionsRepository);

  WatchInscriptions get watchInscriptions => WatchInscriptions(inscriptionsRepository);

  GetInscriptionsByTournament get getInscriptionsByTournament => 
      GetInscriptionsByTournament(inscriptionsRepository);
}
