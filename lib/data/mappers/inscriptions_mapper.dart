import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';
import '../../core/utils/inscription_model_info.dart';
import '../../domain/entities/inscriptions_entity.dart';

class InscriptionsMapper {
  /// Convierte la información de la base de datos (con joins) a la entidad de dominio
  static InscriptionsEntity fromData(InscriptionWithInfo data) {
    final inscription = data.inscription;
    final student = data.student;
    final tournament = data.tournament;
    final group = data.group;

    return InscriptionsEntity(
      id: inscription.id,
      date: inscription.date,
      studentId: inscription.studentId ?? 0,
      tournamentId: inscription.tournamentId ?? 0,
      groupId: inscription.groupId,
      
      // Información de los joins
      studentNames: student.names,
      studentSurnames: student.surnames,
      tournamentName: tournament.name,
      groupName: group?.name,
    );
  }

  /// Convierte la entidad de dominio a un Companion de Drift para inserción/actualización
  static InscriptionCompanion toCompanion(InscriptionsEntity entity) {
    return InscriptionCompanion(
      id: entity.id != null ? Value(entity.id!) : const Value.absent(),
      date: Value(entity.date),
      studentId: Value(entity.studentId),
      tournamentId: Value(entity.tournamentId),
      groupId: Value(entity.groupId),
      updatedAt: Value(DateTime.now()),
    );
  }

  /// Convierte una lista de resultados de BD a una lista de entidades
  static List<InscriptionsEntity> fromDataList(List<InscriptionWithInfo> dataList) {
    return dataList.map((data) => fromData(data)).toList();
  }
}
