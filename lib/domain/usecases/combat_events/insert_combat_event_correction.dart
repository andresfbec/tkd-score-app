import '../../repositories/combat_events_repository.dart';

class InsertCombatEventCorrection {
  final CombatEventsRepository repository;

  InsertCombatEventCorrection(this.repository);

  Future<int> call({
    required int roundId,
    required int pointTypeId,
    required String targetParticipant,
    required double pointsDelta,
    double? matchSeconds,
    int? registeredByJudgeId,
    required int replacesEventId,
  }) async {
    return await repository.insertCorrection(
      roundId: roundId,
      pointTypeId: pointTypeId,
      targetParticipant: targetParticipant,
      pointsDelta: pointsDelta,
      matchSeconds: matchSeconds,
      registeredByJudgeId: registeredByJudgeId,
      replacesEventId: replacesEventId,
    );
  }
}
