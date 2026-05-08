import '../db/app_database_provider.dart';

import '../../../data/datasources/versus_dao.dart';
import '../../../data/repositories_impl/versus_repository_impl.dart';

import '../../../domain/usecases/versus/create_versus.dart';
import '../../../domain/usecases/versus/create_batch_versus.dart';
import '../../../domain/usecases/versus/update_versus.dart';
import '../../../domain/usecases/versus/delete_versus.dart';
import '../../../domain/usecases/versus/delete_all_versus_by_group.dart';
import '../../../domain/usecases/versus/get_versus_by_id.dart';
import '../../../domain/usecases/versus/get_versus_by_group_id.dart';
import '../../../domain/usecases/versus/get_versus_by_group_and_round.dart';
import '../../../domain/usecases/versus/get_versus_by_tournament_id.dart';
import '../../../domain/usecases/versus/watch_versus_by_group_id.dart';
import '../../../domain/usecases/versus/watch_versus_by_group_and_round.dart';
import '../../../domain/usecases/versus/update_versus_state.dart';
import '../../../domain/usecases/versus/set_versus_winner.dart';
import '../../../domain/usecases/versus/swap_versus_participants.dart';
import '../../../domain/usecases/versus/is_versus_round_complete.dart';
import '../../../domain/usecases/versus/get_max_bracket_round.dart';

class InjectionVersus {
  static final InjectionVersus _instance = InjectionVersus._internal();
  factory InjectionVersus() => _instance;
  InjectionVersus._internal();

  VersusRepositoryImpl? _repository;

  VersusRepositoryImpl get _getRepo {
    return _repository ??= VersusRepositoryImpl(
      versusDao: VersusDao(AppDatabaseProvider.instance),
    );
  }

  CreateVersus get createVersus => CreateVersus(_getRepo);
  CreateBatchVersus get createBatchVersus => CreateBatchVersus(_getRepo);
  UpdateVersus get updateVersus => UpdateVersus(_getRepo);
  DeleteVersus get deleteVersus => DeleteVersus(_getRepo);
  DeleteAllVersusByGroup get deleteAllVersusByGroup => DeleteAllVersusByGroup(_getRepo);
  GetVersusById get getVersusById => GetVersusById(_getRepo);
  GetVersusByGroupId get getVersusByGroupId => GetVersusByGroupId(_getRepo);
  GetVersusByGroupAndRound get getVersusByGroupAndRound => GetVersusByGroupAndRound(_getRepo);
  GetVersusByTournamentId get getVersusByTournamentId => GetVersusByTournamentId(_getRepo);
  WatchVersusByGroupId get watchVersusByGroupId => WatchVersusByGroupId(_getRepo);
  WatchVersusByGroupAndRound get watchVersusByGroupAndRound => WatchVersusByGroupAndRound(_getRepo);
  UpdateVersusState get updateVersusState => UpdateVersusState(_getRepo);
  SetVersusWinner get setVersusWinner => SetVersusWinner(_getRepo);
  SwapVersusParticipants get swapVersusParticipants => SwapVersusParticipants(_getRepo);
  IsVersusRoundComplete get isVersusRoundComplete => IsVersusRoundComplete(_getRepo);
  GetMaxBracketRound get getMaxBracketRound => GetMaxBracketRound(_getRepo);
}
