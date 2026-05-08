import '../mappers/combat_rounds_mapper.dart';
import '../../domain/entities/combat_rounds_entity.dart';
import '../../domain/repositories/combat_rounds_repository.dart';
import '../datasources/combat_rounds_dao.dart';
import 'package:drift/drift.dart';

class CombatRoundsRepositoryImpl implements CombatRoundsRepository {
  final CombatRoundsDao combatRoundsDao;

  CombatRoundsRepositoryImpl({required this.combatRoundsDao});

  @override
  Future<int> create(CombatRoundsEntity round) {
    final comp = CombatRoundsMapper.toCompanion(round);

    return combatRoundsDao.insert(
      comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> createBatch(List<CombatRoundsEntity> rounds) {
    final companions = rounds.map((e) {
      final comp = CombatRoundsMapper.toCompanion(e);
      return comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );
    }).toList();

    return combatRoundsDao.insertBatch(companions);
  }

  @override
  Future<bool> update(CombatRoundsEntity round) {
    final comp = CombatRoundsMapper.toCompanion(round);

    return combatRoundsDao.update(comp.copyWith(
      updatedAt: Value(DateTime.now()),
    ));
  }

  @override
  Future<int> delete(int id) {
    return combatRoundsDao.delete(id);
  }

  @override
  Future<CombatRoundsEntity?> getById(int id) async {
    final data = await combatRoundsDao.getById(id);
    if (data == null) return null;
    return CombatRoundsMapper.fromData(data);
  }

  @override
  Future<List<CombatRoundsEntity>> getByVersusId(int versusId) async {
    final list = await combatRoundsDao.getByVersusId(versusId);
    return list.map(CombatRoundsMapper.fromData).toList();
  }

  @override
  Stream<List<CombatRoundsEntity>> watchByVersusId(int versusId) {
    return combatRoundsDao.watchByVersusId(versusId).map(
      (list) => list.map(CombatRoundsMapper.fromData).toList(),
    );
  }

  @override
  Future<bool> updateState(int roundId, String state) {
    return combatRoundsDao.updateState(roundId, state);
  }

  @override
  Future<bool> updatePoints(int roundId, {required int pointsA, required int pointsB}) {
    return combatRoundsDao.updatePoints(roundId, pointsA: pointsA, pointsB: pointsB);
  }

  @override
  Future<bool> setWinner(int roundId, int winnerInscriptionId) {
    return combatRoundsDao.setWinner(roundId, winnerInscriptionId);
  }

  @override
  Future<bool> areAllRoundsComplete(int versusId) {
    return combatRoundsDao.areAllRoundsComplete(versusId);
  }

  @override
  Future<CombatRoundsEntity?> getActiveRound(int versusId) async {
    final data = await combatRoundsDao.getActiveRound(versusId);
    if (data == null) return null;
    return CombatRoundsMapper.fromData(data);
  }

  @override
  Future<void> deleteAllByVersus(int versusId) {
    return combatRoundsDao.deleteAllByVersus(versusId);
  }
}
