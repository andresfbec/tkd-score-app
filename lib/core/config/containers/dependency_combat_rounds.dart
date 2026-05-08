import '../db/app_database_provider.dart';

import '../../../data/datasources/combat_rounds_dao.dart';
import '../../../data/repositories_impl/combat_rounds_repository_impl.dart';

import '../../../domain/usecases/combat_rounds/create_combat_round.dart';
import '../../../domain/usecases/combat_rounds/create_batch_combat_rounds.dart';
import '../../../domain/usecases/combat_rounds/update_combat_round.dart';
import '../../../domain/usecases/combat_rounds/delete_combat_round.dart';
import '../../../domain/usecases/combat_rounds/get_combat_round_by_id.dart';
import '../../../domain/usecases/combat_rounds/get_combat_rounds_by_versus_id.dart';
import '../../../domain/usecases/combat_rounds/watch_combat_rounds_by_versus_id.dart';
import '../../../domain/usecases/combat_rounds/update_combat_round_state.dart';
import '../../../domain/usecases/combat_rounds/update_combat_round_points.dart';
import '../../../domain/usecases/combat_rounds/set_combat_round_winner.dart';
import '../../../domain/usecases/combat_rounds/are_all_rounds_complete.dart';
import '../../../domain/usecases/combat_rounds/get_active_combat_round.dart';
import '../../../domain/usecases/combat_rounds/delete_all_combat_rounds_by_versus.dart';

class InjectionCombatRounds {
  static final InjectionCombatRounds _instance = InjectionCombatRounds._internal();
  factory InjectionCombatRounds() => _instance;
  InjectionCombatRounds._internal();

  CombatRoundsRepositoryImpl? _repository;

  CombatRoundsRepositoryImpl get _getRepo {
    return _repository ??= CombatRoundsRepositoryImpl(
      combatRoundsDao: CombatRoundsDao(AppDatabaseProvider.instance),
    );
  }

  CreateCombatRound get createCombatRound => CreateCombatRound(_getRepo);
  CreateBatchCombatRounds get createBatchCombatRounds => CreateBatchCombatRounds(_getRepo);
  UpdateCombatRound get updateCombatRound => UpdateCombatRound(_getRepo);
  DeleteCombatRound get deleteCombatRound => DeleteCombatRound(_getRepo);
  GetCombatRoundById get getCombatRoundById => GetCombatRoundById(_getRepo);
  GetCombatRoundsByVersusId get getCombatRoundsByVersusId => GetCombatRoundsByVersusId(_getRepo);
  WatchCombatRoundsByVersusId get watchCombatRoundsByVersusId => WatchCombatRoundsByVersusId(_getRepo);
  UpdateCombatRoundState get updateCombatRoundState => UpdateCombatRoundState(_getRepo);
  UpdateCombatRoundPoints get updateCombatRoundPoints => UpdateCombatRoundPoints(_getRepo);
  SetCombatRoundWinner get setCombatRoundWinner => SetCombatRoundWinner(_getRepo);
  AreAllRoundsComplete get areAllRoundsComplete => AreAllRoundsComplete(_getRepo);
  GetActiveCombatRound get getActiveCombatRound => GetActiveCombatRound(_getRepo);
  DeleteAllCombatRoundsByVersus get deleteAllCombatRoundsByVersus => DeleteAllCombatRoundsByVersus(_getRepo);
}
