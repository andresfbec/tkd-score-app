import '../../repositories/combat_rounds_repository.dart';

class UpdateCombatRoundPoints {
  final CombatRoundsRepository repository;

  UpdateCombatRoundPoints(this.repository);

  Future<bool> call(int roundId, {required int pointsA, required int pointsB}) async {
    return await repository.updatePoints(roundId, pointsA: pointsA, pointsB: pointsB);
  }
}
