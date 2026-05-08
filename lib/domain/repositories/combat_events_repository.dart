import '../entities/combat_events_entity.dart';

abstract class CombatEventsRepository {
  Future<int> create(CombatEventsEntity event);
  Future<void> createBatch(List<CombatEventsEntity> events);
  Future<bool> update(CombatEventsEntity event);
  Future<int> delete(int id);
  Future<CombatEventsEntity?> getById(int id);
  Future<List<CombatEventsEntity>> getByRoundId(int roundId);
  Future<List<CombatEventsEntity>> getAllByRoundId(int roundId);
  Stream<List<CombatEventsEntity>> watchByRoundId(int roundId);
  Future<bool> invalidateEvent(int eventId, {required String reason});
  Future<int> insertCorrection({
    required int roundId,
    required String pointType,
    required String targetParticipant,
    required double pointsDelta,
    double? matchSeconds,
    int? registeredByJudgeId,
    required int replacesEventId,
  });
  Future<Map<String, double>> calculateRoundPoints(int roundId);
  Future<void> deleteAllByRound(int roundId);
}
