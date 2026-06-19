import '../entities/combat_rounds_entity.dart';

abstract class CombatRoundsRepository {
  Future<int> create(CombatRoundsEntity round);
  Future<void> createBatch(List<CombatRoundsEntity> rounds);
  Future<bool> update(CombatRoundsEntity round);
  Future<int> delete(int id);
  Future<CombatRoundsEntity?> getById(int id);
  Future<List<CombatRoundsEntity>> getByVersusId(int versusId);
  Stream<List<CombatRoundsEntity>> watchByVersusId(int versusId);
  Future<bool> updateState(int roundId, String state);
  Future<bool> updatePoints(int roundId, {required int pointsA, required int pointsB});
  Future<bool> setWinner(int roundId, int winnerInscriptionId);
  Future<bool> areAllRoundsComplete(int versusId);
  Future<CombatRoundsEntity?> getActiveRound(int versusId);
  Future<void> deleteAllByVersus(int versusId);
}
