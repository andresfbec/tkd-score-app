import '../../entities/combat_rounds_entity.dart';
import '../../repositories/combat_rounds_repository.dart';

class UpdateCombatRound {
  final CombatRoundsRepository repository;

  UpdateCombatRound(this.repository);

  Future<bool> call(CombatRoundsEntity round) async {
    return await repository.update(round);
  }
}
