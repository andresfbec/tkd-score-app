import '../../repositories/students_repository.dart';
import '../../repositories/headquarters_repository.dart';
import '../../repositories/belts_repository.dart';
import '../../entities/students_entity.dart';
import '../../errors/exceptions.dart';
import '../../repositories/headquarters_repository.dart';

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

    if (student.names.trim().isEmpty) {
      throw Exception('El nombre no puede estar vacío');
    }

    if (student.surnames.trim().isEmpty) {
      throw Exception('El apellido no puede estar vacío');
    }

    if (student.typeIdentify.trim().isEmpty) {
      throw Exception('El tipo de documento no puede estar vacío');
    }

    if (student.numberIdentify.trim().isEmpty) {
      throw Exception('El número de documento no puede estar vacío');
    }

    if (student.gender.trim().isEmpty) {
      throw Exception('El género no puede estar vacío');
    }

    if (student.birthDate.isAfter(DateTime.now())) {
      throw Exception('La fecha de nacimiento no puede ser en el futuro');
    }

    if (student.weightKg <= 0) {
      throw Exception('El peso debe ser un número positivo');
    }

    if (student.heightCm <= 0) {
      throw Exception('La talla debe ser un número positivo');
    }

    if (student.headquarterId <= 0) {
      throw Exception('El ID de la sede debe ser un número positivo');
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

    final beltExists = await beltsRepository.getById(student.beltId);

    if (beltExists == null) {
      throw Exception('El cinturón con ID ${student.beltId} no existe');
    }

    final existingStudent = await studentsRepository.find( // hacer esta consulta por número de documento para evitar duplicados
      documentNumber: student.numberIdentify,
    );

    if (existingStudent != null) {
      throw Exception(
        'Ya existe un estudiante con el número de documento ${student.numberIdentify}',
      );
    }

    // ===============================
    // Persistencia
    // ===============================

    return await studentsRepository.create(student);
  }
}
