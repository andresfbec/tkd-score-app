import '../../repositories/combat_events_repository.dart';

class DeleteCombatEvent {
  final CombatEventsRepository repository;

  DeleteCombatEvent(this.repository);

  Future<int> call(int id) async {
    return await repository.delete(id);
  }
}
