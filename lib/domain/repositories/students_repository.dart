import '../entities/students_entity.dart';

abstract class StudentsRepository {
  Future<int> create(StudentsEntity student);
  Future<bool> update(StudentsEntity data);
  Future<int> delete(int id);
  Stream<List<StudentsEntity>> watchStudents({
    List<int>? hqIds,
    List<int>? beltIds,
    String? gender,
    int? minAge,
    int? maxAge,
    double? minWeight,
    double? maxWeight,
    bool? onlyActive,
  });
  // metodos de consulta para logica de negocio (ej: evitar duplicados por número de documento)
  Future<StudentsEntity?> getByIdentification(String number);
  Future<StudentsEntity?> getById(int id);
}
