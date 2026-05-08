import '../../repositories/combat_events_repository.dart';

class InsertCombatEventCorrection {
  final CombatEventsRepository repository;

  InsertCombatEventCorrection(this.repository);

  Future<int> call({
    required int roundId,
    required String pointType,
    required String targetParticipant,
    required double pointsDelta,
    double? matchSeconds,
    int? registeredByJudgeId,
    required int replacesEventId,
  }) async {
    return await repository.insertCorrection(
      roundId: roundId,
      pointType: pointType,
      targetParticipant: targetParticipant,
      pointsDelta: pointsDelta,
      matchSeconds: matchSeconds,
      registeredByJudgeId: registeredByJudgeId,
      replacesEventId: replacesEventId,
    );
  }
}
