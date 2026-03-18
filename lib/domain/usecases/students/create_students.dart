import '../../repositories/students_repository.dart';
import '../../repositories/headquarters_repository.dart';
import '../../repositories/belts_repository.dart';
import '../../entities/students_entity.dart';

class CreateStudent {
  final StudentsRepository studentsRepository;
  final HeadquartersRepository headquartersRepository;
  final BeltsRepository beltsRepository;

  CreateStudent(
    this.studentsRepository,
    this.headquartersRepository,
    this.beltsRepository,
  );

  Future<int> call(StudentsEntity student) async {
    // ===============================
    // Validaciones básicas primero
    // ===============================

    if (student.documentNumber.trim().isEmpty) {
      throw Exception('El número de documento no puede estar vacío');
    }

    if (student.age <= 0) {
      throw Exception('La edad debe ser un número positivo');
    }

    if (student.weight <= 0) {
      throw Exception('El peso debe ser un número positivo');
    }

    if (student.size <= 0) {
      throw Exception('La talla debe ser un número positivo');
    }

    // ===================================
    //  Validaciones contra base de datos
    // ===================================

    final headquarterExists = await headquartersRepository.getById(
      student.headquarterId,
    );

    if (headquarterExists == null) {
      throw Exception('La sede con ID ${student.headquarterId} no existe');
    }

    final beltExists = await beltsRepository.getById(student.beltsId);

    if (beltExists == null) {
      throw Exception('El cinturón con ID ${student.beltsId} no existe');
    }

    final existingStudent = await studentsRepository.find(
      documentNumber: student.documentNumber,
    );

    if (existingStudent != null) {
      throw Exception(
        'Ya existe un estudiante con el número de documento ${student.documentNumber}',
      );
    }

    // ===============================
    // Persistencia
    // ===============================

    return await studentsRepository.create(student);
  }
}
