import '../db/app_database_provider.dart';

import '../../../data/datasources/combat_events_dao.dart';
import '../../../data/repositories_impl/combat_events_repository_impl.dart';

import '../../../domain/usecases/combat_events/create_combat_event.dart';
import '../../../domain/usecases/combat_events/create_batch_combat_events.dart';
import '../../../domain/usecases/combat_events/update_combat_event.dart';
import '../../../domain/usecases/combat_events/delete_combat_event.dart';
import '../../../domain/usecases/combat_events/get_combat_event_by_id.dart';
import '../../../domain/usecases/combat_events/get_combat_events_by_round_id.dart';
import '../../../domain/usecases/combat_events/watch_combat_events_by_round_id.dart';
import '../../../domain/usecases/combat_events/invalidate_combat_event.dart';
import '../../../domain/usecases/combat_events/insert_combat_event_correction.dart';
import '../../../domain/usecases/combat_events/calculate_round_points.dart';
import '../../../domain/usecases/combat_events/delete_all_combat_events_by_round.dart';

class InjectionCombatEvents {
  static final InjectionCombatEvents _instance = InjectionCombatEvents._internal();
  factory InjectionCombatEvents() => _instance;
  InjectionCombatEvents._internal();

  CombatEventsRepositoryImpl? _repository;

  CombatEventsRepositoryImpl get _getRepo {
    return _repository ??= CombatEventsRepositoryImpl(
      combatEventsDao: CombatEventsDao(AppDatabaseProvider.instance),
    );
  }

  CreateCombatEvent get createCombatEvent => CreateCombatEvent(_getRepo);
  CreateBatchCombatEvents get createBatchCombatEvents => CreateBatchCombatEvents(_getRepo);
  UpdateCombatEvent get updateCombatEvent => UpdateCombatEvent(_getRepo);
  DeleteCombatEvent get deleteCombatEvent => DeleteCombatEvent(_getRepo);
  GetCombatEventById get getCombatEventById => GetCombatEventById(_getRepo);
  GetCombatEventsByRoundId get getCombatEventsByRoundId => GetCombatEventsByRoundId(_getRepo);
  WatchCombatEventsByRoundId get watchCombatEventsByRoundId => WatchCombatEventsByRoundId(_getRepo);
  InvalidateCombatEvent get invalidateCombatEvent => InvalidateCombatEvent(_getRepo);
  InsertCombatEventCorrection get insertCombatEventCorrection => InsertCombatEventCorrection(_getRepo);
  CalculateRoundPoints get calculateRoundPoints => CalculateRoundPoints(_getRepo);
  DeleteAllCombatEventsByRound get deleteAllCombatEventsByRound => DeleteAllCombatEventsByRound(_getRepo);
}
