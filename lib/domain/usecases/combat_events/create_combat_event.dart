import '../../entities/combat_events_entity.dart';
import '../../repositories/combat_events_repository.dart';

class CreateCombatEvent {
  final CombatEventsRepository repository;

  CreateCombatEvent(this.repository);

  Future<int> call(CombatEventsEntity event) async {
    return await repository.create(event);
  }
}
