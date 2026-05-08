import 'package:equatable/equatable.dart';

class CombatEventsEntity extends Equatable {
  final int? id;
  final int roundId;
  final String pointType;
  final String targetParticipant;
  final double pointsDelta;
  final double? matchSeconds;
  final int? registeredByJudgeId;
  final int isValid;
  final DateTime? invalidatedAt;
  final String? invalidationReason;
  final int? replacesEventId;

  const CombatEventsEntity({
    this.id,
    required this.roundId,
    required this.pointType,
    required this.targetParticipant,
    required this.pointsDelta,
    this.matchSeconds,
    this.registeredByJudgeId,
    this.isValid = 1,
    this.invalidatedAt,
    this.invalidationReason,
    this.replacesEventId,
  });

  CombatEventsEntity copyWith({
    int? id,
    int? roundId,
    String? pointType,
    String? targetParticipant,
    double? pointsDelta,
    double? matchSeconds,
    int? registeredByJudgeId,
    int? isValid,
    DateTime? invalidatedAt,
    String? invalidationReason,
    int? replacesEventId,
  }) {
    return CombatEventsEntity(
      id: id ?? this.id,
      roundId: roundId ?? this.roundId,
      pointType: pointType ?? this.pointType,
      targetParticipant: targetParticipant ?? this.targetParticipant,
      pointsDelta: pointsDelta ?? this.pointsDelta,
      matchSeconds: matchSeconds ?? this.matchSeconds,
      registeredByJudgeId: registeredByJudgeId ?? this.registeredByJudgeId,
      isValid: isValid ?? this.isValid,
      invalidatedAt: invalidatedAt ?? this.invalidatedAt,
      invalidationReason: invalidationReason ?? this.invalidationReason,
      replacesEventId: replacesEventId ?? this.replacesEventId,
    );
  }

  @override
  List<Object?> get props => [
        id,
        roundId,
        pointType,
        targetParticipant,
        pointsDelta,
        matchSeconds,
        registeredByJudgeId,
        isValid,
        invalidatedAt,
        invalidationReason,
        replacesEventId,
      ];
}
