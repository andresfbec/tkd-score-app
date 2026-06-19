import '../../domain/entities/combat_events_entity.dart';
import '../../core/config/db/database.dart';
import 'package:drift/drift.dart';

class CombatEventsMapper {
  static CombatEventsEntity fromData(CombatEvent data) {
    return CombatEventsEntity(
      id: data.id,
      roundId: data.roundId,
      pointTypeId: data.pointTypeId,
      targetParticipant: data.targetParticipant,
      pointsDelta: data.pointsDelta,
      matchSeconds: data.matchSeconds,
      registeredByJudgeId: data.registeredByJudgeId,
      isValid: data.isValid,
      invalidatedAt: data.invalidatedAt,
      invalidationReason: data.invalidationReason,
      replacesEventId: data.replacesEventId,
    );
  }

  static CombatEventsCompanion toCompanion(CombatEventsEntity entity) {
    return CombatEventsCompanion(
      id: entity.id != null ? Value(entity.id!) : const Value.absent(),
      roundId: Value(entity.roundId),
      pointTypeId: Value(entity.pointTypeId),
      targetParticipant: Value(entity.targetParticipant),
      pointsDelta: Value(entity.pointsDelta),
      matchSeconds: entity.matchSeconds != null ? Value(entity.matchSeconds!) : const Value.absent(),
      registeredByJudgeId: entity.registeredByJudgeId != null ? Value(entity.registeredByJudgeId!) : const Value.absent(),
      isValid: Value(entity.isValid),
      invalidatedAt: entity.invalidatedAt != null ? Value(entity.invalidatedAt!) : const Value.absent(),
      invalidationReason: entity.invalidationReason != null ? Value(entity.invalidationReason!) : const Value.absent(),
      replacesEventId: entity.replacesEventId != null ? Value(entity.replacesEventId!) : const Value.absent(),
    );
  }
}
