import '../../entities/combat_rounds_entity.dart';
import '../../repositories/combat_rounds_repository.dart';

class GetCombatRoundsByVersusId {
  final CombatRoundsRepository repository;

  GetCombatRoundsByVersusId(this.repository);

  Future<List<CombatRoundsEntity>> call(int versusId) async {
    return await repository.getByVersusId(versusId);
  }
}
