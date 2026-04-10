import '../../entities/students_entity.dart';
import '../../repositories/students_repository.dart';
import '../../repositories/students_repository.dart';
import '../../repositories/belts_repository.dart';
import '../../repositories/headquarters_repository.dart';

class UpdateStudent {
  final StudentsRepository studentsRepository;
  final HeadquartersRepository headquartersRepository;
  final BeltsRepository beltsRepository;

  UpdateStudent(
    this.studentsRepository,
    this.headquartersRepository,
    this.beltsRepository,
  );

  Future<bool> call(StudentsEntity student) async {
    // 1. EL ID ES OBLIGATORIO PARA EDITAR
    if (student.id == null || student.id! <= 0) {
      throw Exception('Error: No se puede actualizar un estudiante sin un ID válido.');
    }

    // 2. VALIDACIONES DE FORMATO (Lógica de negocio básica)
    _validateFields(student);

    // 3. VERIFICAR QUE EL ESTUDIANTE EXISTA EN LA DB
    // Esto nos sirve para recuperar sus estadísticas actuales y no perderlas
    final currentStudent = await studentsRepository.getById(student.id!);
    if (currentStudent == null) {
      throw Exception('Error: El estudiante con ID ${student.id} no existe en la base de datos.');
    }

    // 4. VALIDACIÓN DE SEDE Y CINTURÓN (Integridad Referencial)
    final hqExists = await headquartersRepository.getById(student.headquarterId);
    if (hqExists == null) {
      throw Exception('La sede seleccionada (ID: ${student.headquarterId}) no es válida.');
    }

    final beltExists = await beltsRepository.getById(student.beltId);
    if (beltExists == null) {
      throw Exception('El cinturón seleccionado (ID: ${student.beltId}) no es válido.');
    }

    // 5. VALIDACIÓN DE DUPLICADOS (La más importante)
    // Buscamos si existe OTRO estudiante con ese mismo número de identificación
    final studentWithSameDoc = await studentsRepository.getByIdentification(student.numberIdentify);

    // Si el documento existe Y pertenece a un ID diferente, hay un choque de identidad
    if (studentWithSameDoc != null && studentWithSameDoc.id != student.id) {
      throw Exception(
        'Conflicto de Identidad: El número ${student.numberIdentify} ya está registrado a nombre de ${studentWithSameDoc.names} ${studentWithSameDoc.surnames}.'
      );
    }

    // 6. PROTECCIÓN DE DATOS SENSIBLES (Estadísticas)
    // Usamos copyWith para asegurar que el usuario no "infle" sus victorias 
    // desde un formulario de edición de perfil.
    final studentToUpdate = student.copyWith(
      tournamentWins: currentStudent.tournamentWins, // Mantenemos lo que dice la DB
      participations: currentStudent.participations, // Mantenemos lo que dice la DB
      // El resto de campos (nombres, peso, talla, etc.) sí se actualizan con lo que viene del form
    );

    // 7. PERSISTENCIA FINAL
    return await studentsRepository.update(studentToUpdate);
  }

  /// Centraliza las validaciones de texto y números para no ensuciar el flujo principal
  void _validateFields(StudentsEntity student) {
    if (student.names.trim().isEmpty || student.surnames.trim().isEmpty) {
      throw Exception('El nombre y el apellido son campos obligatorios.');
    }

    if (student.typeIdentify.trim().isEmpty || student.numberIdentify.trim().isEmpty) {
      throw Exception('La información de identificación es obligatoria.');
    }

    // Validación de edad mínima (Ejemplo: no registrar niños de 0 años si tu academia no los acepta)
    if (student.birthDate.isAfter(DateTime.now().subtract(const Duration(days: 365)))) {
      throw Exception('La fecha de nacimiento no es coherente para un practicante de Taekwondo.');
    }

    if (student.weightKg < 10.0 || student.weightKg > 200.0) {
      throw Exception('El peso ingresado (${student.weightKg}kg) parece estar fuera de rango.');
    }

    if (student.heightCm < 50.0 || student.heightCm > 250.0) {
      throw Exception('La estatura ingresada (${student.heightCm}cm) no es válida.');
    }
    
    if (student.gender.trim().isEmpty) {
      throw Exception('El género es obligatorio para la categorización en torneos.');
    }
  }
}
