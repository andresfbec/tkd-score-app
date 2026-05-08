import '../mappers/combat_events_mapper.dart';
import '../../domain/entities/combat_events_entity.dart';
import '../../domain/repositories/combat_events_repository.dart';
import '../datasources/combat_events_dao.dart';
import 'package:drift/drift.dart';

class CombatEventsRepositoryImpl implements CombatEventsRepository {
  final CombatEventsDao combatEventsDao;

  CombatEventsRepositoryImpl({required this.combatEventsDao});

  @override
  Future<int> create(CombatEventsEntity event) {
    final comp = CombatEventsMapper.toCompanion(event);

    return combatEventsDao.insert(
      comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> createBatch(List<CombatEventsEntity> events) {
    final companions = events.map((e) {
      final comp = CombatEventsMapper.toCompanion(e);
      return comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );
    }).toList();

    return combatEventsDao.insertBatch(companions);
  }

  @override
  Future<bool> update(CombatEventsEntity event) {
    final comp = CombatEventsMapper.toCompanion(event);

    return combatEventsDao.update(comp.copyWith(
      updatedAt: Value(DateTime.now()),
    ));
  }

  @override
  Future<int> delete(int id) {
    return combatEventsDao.delete(id);
  }

  @override
  Future<CombatEventsEntity?> getById(int id) async {
    final data = await combatEventsDao.getById(id);
    if (data == null) return null;
    return CombatEventsMapper.fromData(data);
  }

  @override
  Future<List<CombatEventsEntity>> getByRoundId(int roundId) async {
    final list = await combatEventsDao.getByRoundId(roundId);
    return list.map(CombatEventsMapper.fromData).toList();
  }

  @override
  Future<List<CombatEventsEntity>> getAllByRoundId(int roundId) async {
    final list = await combatEventsDao.getAllByRoundId(roundId);
    return list.map(CombatEventsMapper.fromData).toList();
  }

  @override
  Stream<List<CombatEventsEntity>> watchByRoundId(int roundId) {
    return combatEventsDao.watchByRoundId(roundId).map(
      (list) => list.map(CombatEventsMapper.fromData).toList(),
    );
  }

  @override
  Future<bool> invalidateEvent(int eventId, {required String reason}) {
    return combatEventsDao.invalidateEvent(eventId, reason: reason);
  }

  @override
  Future<int> insertCorrection({
    required int roundId,
    required String pointType,
    required String targetParticipant,
    required double pointsDelta,
    double? matchSeconds,
    int? registeredByJudgeId,
    required int replacesEventId,
  }) {
    return combatEventsDao.insertCorrection(
      roundId: roundId,
      pointType: pointType,
      targetParticipant: targetParticipant,
      pointsDelta: pointsDelta,
      matchSeconds: matchSeconds,
      registeredByJudgeId: registeredByJudgeId,
      replacesEventId: replacesEventId,
    );
  }

  @override
  Future<Map<String, double>> calculateRoundPoints(int roundId) {
    return combatEventsDao.calculateRoundPoints(roundId);
  }

  @override
  Future<void> deleteAllByRound(int roundId) {
    return combatEventsDao.deleteAllByRound(roundId);
  }
}
