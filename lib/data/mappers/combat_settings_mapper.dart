import '../../domain/entities/combat_settings_entity.dart';
import '../../core/config/db/database.dart';
import 'package:drift/drift.dart';

class CombatSettingsMapper {
  static CombatSettingsEntity fromData(CombatSetting data) {
    return CombatSettingsEntity(
      id: data.id,
      tournamentId: data.tournamentId,
      roundsMax: data.roundsMax,
      formatType: data.formatType,
      roundDurationSeconds: data.roundDurationSeconds,
      pointsToWin: data.pointsToWin,
      playAllRounds: data.playAllRounds,
      eliminationType: data.eliminationType,
    );
  }

  static CombatSettingsCompanion toCompanion(CombatSettingsEntity entity) {
    return CombatSettingsCompanion(
      id: entity.id != null ? Value(entity.id!) : const Value.absent(),
      tournamentId: Value(entity.tournamentId),
      roundsMax: Value(entity.roundsMax),
      formatType: Value(entity.formatType),
      roundDurationSeconds: Value(entity.roundDurationSeconds),
      pointsToWin: entity.pointsToWin != null ? Value(entity.pointsToWin!) : const Value.absent(),
      playAllRounds: Value(entity.playAllRounds),
      eliminationType: Value(entity.eliminationType),
      // createdAt, updatedAt, synchronized y isActive no se incluyen desde el entity 
      // y asumen su valor por defecto configurado en la base de datos o se gestionan en el DAO.
    );
  }
}
