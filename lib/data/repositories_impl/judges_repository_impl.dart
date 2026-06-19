import '../../domain/entities/judge_entity.dart';
import '../../domain/repositories/judges_repository.dart';
import '../datasources/judges_dao.dart';
import '../mappers/judges_mapper.dart';

class JudgesRepositoryImpl implements JudgesRepository {
  final JudgesDao _judgesDao;

  JudgesRepositoryImpl(this._judgesDao);

  @override
  Future<int> create(JudgeEntity judge) async {
    final companion = JudgesMapper.toCompanion(judge);
    return await _judgesDao.insert(companion);
  }

  @override
  Future<bool> update(JudgeEntity judge) async {
    final companion = JudgesMapper.toCompanion(judge);
    return await _judgesDao.update(companion);
  }

  @override
  Future<int> delete(int id) async {
    return await _judgesDao.delete(id);
  }

  @override
  Stream<List<JudgeEntity>> watchJudges({bool onlyActive = true}) {
    return _judgesDao.watchJudges(onlyActive: onlyActive).map(
          (list) => list.map(JudgesMapper.fromData).toList(),
        );
  }

  @override
  Future<JudgeEntity?> getById(int id) async {
    final data = await _judgesDao.getJudgeById(id);
    return data != null ? JudgesMapper.fromData(data) : null;
  }

  @override
  Future<void> assignToTournament(int judgeId, int tournamentId) async {
    await _judgesDao.assignToTournament(judgeId, tournamentId);
  }

  @override
  Future<void> removeFromTournament(int judgeId, int tournamentId) async {
    await _judgesDao.removeFromTournament(judgeId, tournamentId);
  }

  @override
  Stream<List<JudgeEntity>> watchJudgesByTournament(int tournamentId) {
    return _judgesDao.watchJudgesByTournament(tournamentId).map(
          (list) => list.map(JudgesMapper.fromData).toList(),
        );
  }
}
