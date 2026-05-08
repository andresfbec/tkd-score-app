import '../../repositories/combat_rounds_repository.dart';

class AreAllRoundsComplete {
  final CombatRoundsRepository repository;

  AreAllRoundsComplete(this.repository);

  Future<bool> call(int versusId) async {
    return await repository.areAllRoundsComplete(versusId);
  }
}
