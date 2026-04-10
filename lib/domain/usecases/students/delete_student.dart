import '../../repositories/students_repository.dart';

class DeleteStudent {
  final StudentsRepository studentsRepository;


  DeleteStudent(
    this.studentsRepository,
  );

  Future<int> call(int id) async {
    // ===============================
    // Validaciones básicas primero
    // ===============================

    if (id <= 0) {
      throw Exception('El ID del estudiante debe ser un número positivo');
    }

    final existingStudent = await studentsRepository.getById(id);

    if (existingStudent == null) {
      throw Exception('No existe un estudiante con el ID $id');
    }

    // ===============================
    // Mas adelante validar si existe un torneo activo donde el estudiante esté participando, para evitar eliminarlo mientras compite
    // ===============================

    // ===============================
    // Persistencia
    // ===============================

    return await studentsRepository.delete(id);
  }

}
