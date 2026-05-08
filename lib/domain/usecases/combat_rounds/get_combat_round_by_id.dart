import '../../entities/combat_rounds_entity.dart';
import '../../repositories/combat_rounds_repository.dart';

class GetCombatRoundById {
  final CombatRoundsRepository repository;

  GetCombatRoundById(this.repository);

  Future<CombatRoundsEntity?> call(int id) async {
    return await repository.getById(id);
  }
}
