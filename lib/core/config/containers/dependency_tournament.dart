import '../db/app_database_provider.dart';
import '../../../data/datasources/tournament_dao.dart';
import '../../../data/datasources/combat_settings_dao.dart';
import '../../../data/repositories_impl/tournament_repository_impl.dart';

import '../../../domain/usecases/tournament/create_tournament.dart';
import '../../../domain/usecases/tournament/update_tournament.dart';
import '../../../domain/usecases/tournament/delete_tournament.dart';
import '../../../domain/usecases/tournament/get_all_tournaments.dart';
import '../../../domain/usecases/tournament/get_tournament_by_id.dart';
import '../../../domain/usecases/tournament/find_tournaments.dart';
import '../../../domain/usecases/tournament/watch_tournaments.dart';
import '../../../domain/usecases/tournament/start_tournament.dart';
import '../../../domain/usecases/tournament/sync_tournament_setup_phase.dart';

class InjectionTournament {
  static final InjectionTournament _instance = InjectionTournament._internal();
  factory InjectionTournament() => _instance;
  InjectionTournament._internal();

  TournamentRepositoryImpl? _repository;

  TournamentRepositoryImpl get tournamentRepository {
    return _repository ??= TournamentRepositoryImpl(
      TournamentDao(AppDatabaseProvider.instance),
      CombatSettingsDao(AppDatabaseProvider.instance),
    );
  }

  CreateTournament get createTournament => CreateTournament(tournamentRepository);
  UpdateTournament get updateTournament => UpdateTournament(tournamentRepository);
  DeleteTournament get deleteTournament => DeleteTournament(tournamentRepository);
  GetAllTournaments get getAllTournaments => GetAllTournaments(tournamentRepository);
  GetTournamentById get getTournamentById => GetTournamentById(tournamentRepository);
  FindTournaments get findTournaments => FindTournaments(tournamentRepository);
  WatchTournaments get watchTournaments => WatchTournaments(tournamentRepository);
  StartTournament get startTournament => StartTournament(tournamentRepository);
  SyncTournamentSetupPhase get syncTournamentSetupPhase => SyncTournamentSetupPhase(tournamentRepository);
}
