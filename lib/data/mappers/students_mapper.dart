import '../../domain/entities/students_entity.dart';
import '../../core/config/db/database.dart';
import 'package:drift/drift.dart';
import '../../core/utils/student_model_info_coplete.dart';

class StudentsMapper {
  static StudentsEntity fromData(StudentWithInfo data) {
    final student = data.student;
    final hq = data.headquarter;
    final belt = data.belt;

    return StudentsEntity(
      id: student.id,
      names: student.names,
      surnames: student.surnames,
      typeIdentify: student.typeIdentify,
      numberIdentify: student.numberIdentify,
      gender: student.gender,
      birthDate: student.birthDate,
      tournamentWins: student.tournamentWins,
      participations: student.participations,
      weightKg: student.weightKg,
      heightCm: student.heightCm,
      headquarterId: student.headquarterId,
      beltId: student.beltId,

      headquarterName: hq?.name,            // Viene de la tabla Headquarters
      beltName: belt?.name,                 // Viene de la tabla Belts
      beltPrimaryColor: belt?.primaryColor,     // Color principal
      beltSecondaryColor: belt?.secondaryColor, // Color de la franja
    );
  }

  static StudentsCompanion toCompanion(StudentsEntity entity) {
    return StudentsCompanion(
      id: entity.id != null ? Value(entity.id!) : const Value.absent(),
      names: Value(entity.names),
      surnames: Value(entity.surnames),
      typeIdentify: Value(entity.typeIdentify),
      numberIdentify: Value(entity.numberIdentify),
      gender: Value(entity.gender),
      birthDate: Value(entity.birthDate),
      // tournamentWins: Value(entity.tournamentWins),
      // participations: Value(entity.participations),
      weightKg: Value(entity.weightKg),
      heightCm: Value(entity.heightCm),
      headquarterId: Value(entity.headquarterId),
      beltId: Value(entity.beltId),
    );
  }
}
