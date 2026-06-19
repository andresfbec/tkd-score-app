import '../../entities/combat_rounds_entity.dart';
import '../../repositories/combat_rounds_repository.dart';

class CreateBatchCombatRounds {
  final CombatRoundsRepository repository;

  CreateBatchCombatRounds(this.repository);

  Future<void> call(List<CombatRoundsEntity> rounds) async {
    return await repository.createBatch(rounds);
  }
}
