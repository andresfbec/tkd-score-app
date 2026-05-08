import '../../repositories/combat_events_repository.dart';

class CalculateRoundPoints {
  final CombatEventsRepository repository;

  CalculateRoundPoints(this.repository);

  Future<Map<String, double>> call(int roundId) async {
    return await repository.calculateRoundPoints(roundId);
  }
}
