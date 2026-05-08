import '../entities/versus_entity.dart';

abstract class VersusRepository {
  Future<int> create(VersusEntity versus);
  Future<void> createBatch(List<VersusEntity> versusList);
  Future<bool> update(VersusEntity versus);
  Future<int> delete(int id);
  Future<void> deleteAllByGroup(int groupId);
  Future<VersusEntity?> getById(int id);
  Future<List<VersusEntity>> getByGroupId(int groupId);
  Future<List<VersusEntity>> getByGroupAndRound(int groupId, int bracketRound);
  Future<List<VersusEntity>> getByTournamentId(int tournamentId);
  Stream<List<VersusEntity>> watchByGroupId(int groupId);
  Stream<List<VersusEntity>> watchByGroupAndRound(int groupId, int bracketRound);
  Future<bool> updateState(int versusId, String state);
  Future<bool> setWinner(int versusId, int winnerInscriptionId);
  Future<void> swapParticipants({
    required int versusIdA,
    required String slotA,
    required int versusIdB,
    required String slotB,
  });
  Future<bool> isRoundComplete(int groupId, int bracketRound);
  Future<int> getMaxBracketRound(int groupId);
}
