import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';
import '../../domain/entities/judge_entity.dart';

class JudgesMapper {
  static JudgeEntity fromData(JudgeData data) {
    return JudgeEntity(
      id: data.id,
      names: data.names,
      document: data.document,
      club: data.club,
      phone: data.phone,
      rank: data.rank,
      participations: data.participations,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      isActive: data.isActive == 1,
    );
  }

  static JudgeCompanion toCompanion(JudgeEntity entity) {
    return JudgeCompanion(
      id: entity.id != null ? Value(entity.id!) : const Value.absent(),
      names: Value(entity.names),
      document: Value(entity.document),
      club: Value(entity.club),
      phone: Value(entity.phone),
      rank: Value(entity.rank),
      participations: Value(entity.participations),
      isActive: Value(entity.isActive ? 1 : 0),
    );
  }
}
