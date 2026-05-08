import '../../entities/combat_rounds_entity.dart';
import '../../repositories/combat_rounds_repository.dart';

class CreateCombatRound {
  final CombatRoundsRepository repository;

  CreateCombatRound(this.repository);

  Future<int> call(CombatRoundsEntity round) async {
    return await repository.create(round);
  }
}
