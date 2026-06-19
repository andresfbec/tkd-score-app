import '../../entities/combat_rounds_entity.dart';
import '../../repositories/combat_rounds_repository.dart';

class GetActiveCombatRound {
  final CombatRoundsRepository repository;

  GetActiveCombatRound(this.repository);

  Future<CombatRoundsEntity?> call(int versusId) async {
    return await repository.getActiveRound(versusId);
  }
}
