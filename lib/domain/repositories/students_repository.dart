import '../entities/students_entity.dart';

abstract class StudentsRepository {
  Future<int> create(StudentsEntity student);
  Future<int> update(StudentsEntity data);
  Future<int> delete(int id);
  Future<List<StudentsEntity>> getAll();
  Future<StudentsEntity?> getById(int id);
  Future<StudentsEntity?> find({
    String? documentNumber,
    int? headquarterId,
    int? age,
    int? beltsId,
  });
}
