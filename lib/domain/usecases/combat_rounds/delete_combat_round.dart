import '../../repositories/combat_rounds_repository.dart';

class DeleteCombatRound {
  final CombatRoundsRepository repository;

  DeleteCombatRound(this.repository);

  Future<int> call(int id) async {
    return await repository.delete(id);
  }
}
