import '../../domain/entities/combat_rounds_entity.dart';
import '../../core/config/db/database.dart';
import 'package:drift/drift.dart';

class CombatRoundsMapper {
  static CombatRoundsEntity fromData(CombatRound data) {
    return CombatRoundsEntity(
      id: data.id,
      versusId: data.versusId,
      roundNumber: data.roundNumber,
      pointsA: data.pointsA,
      pointsB: data.pointsB,
      winnerInscriptionId: data.winnerInscriptionId,
      state: data.state,
      startAt: data.startAt,
      endAt: data.endAt,
    );
  }

  static CombatRoundsCompanion toCompanion(CombatRoundsEntity entity) {
    return CombatRoundsCompanion(
      id: entity.id != null ? Value(entity.id!) : const Value.absent(),
      versusId: Value(entity.versusId),
      roundNumber: Value(entity.roundNumber),
      pointsA: Value(entity.pointsA),
      pointsB: Value(entity.pointsB),
      winnerInscriptionId: entity.winnerInscriptionId != null ? Value(entity.winnerInscriptionId!) : const Value.absent(),
      state: Value(entity.state),
      startAt: Value(entity.startAt),
      endAt: entity.endAt != null ? Value(entity.endAt!) : const Value.absent(),
    );
  }
}
