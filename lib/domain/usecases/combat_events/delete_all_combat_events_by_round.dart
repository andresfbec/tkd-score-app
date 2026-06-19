import '../../repositories/combat_events_repository.dart';

class DeleteAllCombatEventsByRound {
  final CombatEventsRepository repository;

  DeleteAllCombatEventsByRound(this.repository);

  Future<void> call(int roundId) async {
    return await repository.deleteAllByRound(roundId);
  }
}
