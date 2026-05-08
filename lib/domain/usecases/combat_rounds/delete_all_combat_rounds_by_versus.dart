import '../../repositories/combat_rounds_repository.dart';

class DeleteAllCombatRoundsByVersus {
  final CombatRoundsRepository repository;

  DeleteAllCombatRoundsByVersus(this.repository);

  Future<void> call(int versusId) async {
    return await repository.deleteAllByVersus(versusId);
  }
}
