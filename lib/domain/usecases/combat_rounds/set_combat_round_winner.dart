import '../../repositories/combat_rounds_repository.dart';

class SetCombatRoundWinner {
  final CombatRoundsRepository repository;

  SetCombatRoundWinner(this.repository);

  Future<bool> call(int roundId, int winnerInscriptionId) async {
    return await repository.setWinner(roundId, winnerInscriptionId);
  }
}
