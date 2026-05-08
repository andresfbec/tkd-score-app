import '../../domain/entities/versus_entity.dart';
import '../../core/config/db/database.dart';
import 'package:drift/drift.dart';

class VersusMapper {
  static VersusEntity fromData(VersusData data) {
    return VersusEntity(
      id: data.id,
      tournamentId: data.tournamentId,
      inscriptionAId: data.inscriptionAId,
      inscriptionBId: data.inscriptionBId,
      groupId: data.groupId,
      winnerInscriptionId: data.winnerInscriptionId,
      bracketRound: data.bracketRound,
      bracketOrder: data.bracketOrder,
      nextVsWinnerId: data.nextVsWinnerId,
      nextVsLoserId: data.nextVsLoserId,
      state: data.state,
    );
  }

  static VersusCompanion toCompanion(VersusEntity entity) {
    return VersusCompanion(
      id: entity.id != null ? Value(entity.id!) : const Value.absent(),
      tournamentId: Value(entity.tournamentId),
      inscriptionAId: Value(entity.inscriptionAId),
      inscriptionBId: Value(entity.inscriptionBId),
      groupId: Value(entity.groupId),
      winnerInscriptionId: entity.winnerInscriptionId != null ? Value(entity.winnerInscriptionId!) : const Value.absent(),
      bracketRound: Value(entity.bracketRound),
      bracketOrder: Value(entity.bracketOrder),
      nextVsWinnerId: entity.nextVsWinnerId != null ? Value(entity.nextVsWinnerId!) : const Value.absent(),
      nextVsLoserId: entity.nextVsLoserId != null ? Value(entity.nextVsLoserId!) : const Value.absent(),
      state: Value(entity.state),
    );
  }
}
