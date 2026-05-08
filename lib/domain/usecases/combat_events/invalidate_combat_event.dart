import '../../repositories/combat_events_repository.dart';

class InvalidateCombatEvent {
  final CombatEventsRepository repository;

  InvalidateCombatEvent(this.repository);

  Future<bool> call(int eventId, {required String reason}) async {
    return await repository.invalidateEvent(eventId, reason: reason);
  }
}
