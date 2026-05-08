import '../../entities/combat_events_entity.dart';
import '../../repositories/combat_events_repository.dart';

class CreateBatchCombatEvents {
  final CombatEventsRepository repository;

  CreateBatchCombatEvents(this.repository);

  Future<void> call(List<CombatEventsEntity> events) async {
    return await repository.createBatch(events);
  }
}
