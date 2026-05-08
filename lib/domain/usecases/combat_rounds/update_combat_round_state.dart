import '../../repositories/combat_rounds_repository.dart';

class UpdateCombatRoundState {
  final CombatRoundsRepository repository;

  UpdateCombatRoundState(this.repository);

  Future<bool> call(int roundId, String state) async {
    return await repository.updateState(roundId, state);
  }
}
