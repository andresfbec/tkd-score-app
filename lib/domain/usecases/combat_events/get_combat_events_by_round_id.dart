import '../../entities/combat_events_entity.dart';
import '../../repositories/combat_events_repository.dart';

class GetCombatEventsByRoundId {
  final CombatEventsRepository repository;

  GetCombatEventsByRoundId(this.repository);

  Future<List<CombatEventsEntity>> call(int roundId, {bool all = false}) async {
    if (all) {
      return await repository.getAllByRoundId(roundId);
    }
    return await repository.getByRoundId(roundId);
  }
}
