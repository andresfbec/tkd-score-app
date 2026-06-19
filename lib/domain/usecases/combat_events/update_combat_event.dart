import '../../entities/combat_events_entity.dart';
import '../../repositories/combat_events_repository.dart';

class UpdateCombatEvent {
  final CombatEventsRepository repository;

  UpdateCombatEvent(this.repository);

  Future<bool> call(CombatEventsEntity event) async {
    return await repository.update(event);
  }
}
