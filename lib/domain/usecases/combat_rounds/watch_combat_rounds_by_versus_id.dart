import '../../entities/combat_rounds_entity.dart';
import '../../repositories/combat_rounds_repository.dart';

class WatchCombatRoundsByVersusId {
  final CombatRoundsRepository repository;

  WatchCombatRoundsByVersusId(this.repository);

  Stream<List<CombatRoundsEntity>> call(int versusId) {
    return repository.watchByVersusId(versusId);
  }
}
