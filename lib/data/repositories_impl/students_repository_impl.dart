import '../mappers/students_mapper.dart';
import '../../domain/entities/students_entity.dart';
import '../../domain/repositories/students_repository.dart';
import '../datasources/students_dao.dart';

class StudentsRepositoryImpl implements StudentsRepository {
  final StudentsDao studentsDao;

  StudentsRepositoryImpl({required this.studentsDao});

  @override
  Future<int> create(StudentsEntity student) {
    return studentsDao.insert(
      names: student.names,
      surnames: student.surnames,
      typeDocument: student.typeDocument,
      documentNumber: student.documentNumber,
      age: student.age,
      gender: student.gender,
      weight: student.weight,
      size: student.size,
      headquarterId: student.headquarterId,
      beltsId: student.beltsId,
    );
  }

  @override
  Future<int> update(StudentsEntity student) {
    return studentsDao.update(student);
  }

  @override
  Future<int> delete(int id) {
    return studentsDao.delete(id);
  }

  @override
  Future<StudentsEntity?> getById(int id) async {
    final map = await studentsDao.findById(id);
    return map != null ? StudentsMapper.fromMap(map) : null;
  }

  @override
  Future<List<StudentsEntity>> getAll() async {
    final result = await studentsDao.findAll();
    return result.map(StudentsMapper.fromMap).toList();
  }

  @override
  Future<StudentsEntity?> find({
    String? documentNumber,
    int? headquarterId,
    int? age,
    int? beltsId,
  }) async {
    final filters = <String, dynamic>{};

    if (documentNumber != null) filters['documentNumber'] = documentNumber;
    if (headquarterId != null) filters['headquarterId'] = headquarterId;
    if (age != null) filters['age'] = age;
    if (beltsId != null) filters['beltsId'] = beltsId;

    final map = await studentsDao.query(filters: filters);
    return map != null ? StudentsMapper.fromMap(map) : null;
  }
}
