import '../../entities/combat_events_entity.dart';
import '../../repositories/combat_events_repository.dart';

class WatchCombatEventsByRoundId {
  final CombatEventsRepository repository;

  WatchCombatEventsByRoundId(this.repository);

  Stream<List<CombatEventsEntity>> call(int roundId) {
    return repository.watchByRoundId(roundId);
  }
}
