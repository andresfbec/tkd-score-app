import '../db/database.dart';
import '../db/app_database_provider.dart';

// DAOs y Repos Impl
import '../../../data/datasources/judges_dao.dart';
import '../../../data/repositories_impl/judges_repository_impl.dart';

// Use Cases
import '../../../domain/usecases/judges/create_judge.dart';
import '../../../domain/usecases/judges/update_judge.dart';
import '../../../domain/usecases/judges/delete_judge.dart';
import '../../../domain/usecases/judges/watch_judges.dart';
import '../../../domain/usecases/judges/assign_judge_to_tournament.dart';
import '../../../domain/usecases/judges/remove_judge_from_tournament.dart';
import '../../../domain/usecases/judges/watch_judges_by_tournament.dart';

class InjectionJudges {
  static final InjectionJudges _instance = InjectionJudges._internal();
  factory InjectionJudges() => _instance;
  InjectionJudges._internal();

  JudgesRepositoryImpl? _repository;

  JudgesRepositoryImpl get judgesRepository {
    return _repository ??= JudgesRepositoryImpl(
      JudgesDao(AppDatabaseProvider.instance),
    );
  }

  CreateJudge get createJudge => CreateJudge(judgesRepository);
  UpdateJudge get updateJudge => UpdateJudge(judgesRepository);
  DeleteJudge get deleteJudge => DeleteJudge(judgesRepository);
  WatchJudges get watchJudges => WatchJudges(judgesRepository);
  AssignJudgeToTournament get assignJudgeToTournament => AssignJudgeToTournament(judgesRepository);
  RemoveJudgeFromTournament get removeJudgeFromTournament => RemoveJudgeFromTournament(judgesRepository);
  WatchJudgesByTournament get watchJudgesByTournament => WatchJudgesByTournament(judgesRepository);
}
