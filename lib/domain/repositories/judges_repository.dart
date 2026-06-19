import '../entities/judge_entity.dart';

abstract class JudgesRepository {
  Future<int> create(JudgeEntity judge);
  Future<bool> update(JudgeEntity judge);
  Future<int> delete(int id);
  Stream<List<JudgeEntity>> watchJudges({bool onlyActive = true});
  Future<JudgeEntity?> getById(int id);

  // Relación con torneos
  Future<void> assignToTournament(int judgeId, int tournamentId);
  Future<void> removeFromTournament(int judgeId, int tournamentId);
  Stream<List<JudgeEntity>> watchJudgesByTournament(int tournamentId);
}
