import '../mappers/students_mapper.dart';
import '../../domain/entities/students_entity.dart';
import '../../domain/repositories/students_repository.dart';
import '../datasources/students_dao.dart';
import 'package:drift/drift.dart';

class StudentsRepositoryImpl implements StudentsRepository {
  final StudentsDao studentsDao;

  StudentsRepositoryImpl({required this.studentsDao});

  @override
  Future<int> create(StudentsEntity student) {
    final comp = StudentsMapper.toCompanion(student);

    return studentsDao.insert(
      comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<bool> update(StudentsEntity student) {
    final comp = StudentsMapper.toCompanion(student);

    return studentsDao.update(comp.copyWith(
      updatedAt: Value(DateTime.now())
      )
    );
  }

  @override
  Future<int> delete(int id) {
    return studentsDao.delete(id);
  }

  @override
  Stream<List<StudentsEntity>> watchStudents({
    List<int>? hqIds,
    List<int>? beltIds,
    String? gender,
    int? minAge,
    int? maxAge,
    double? minWeight,
    double? maxWeight,
    bool? onlyActive,
  }) {
    return studentsDao.watchStudents(
      hqIds: hqIds,
      beltIds: beltIds,
      gender: gender,
      minAge: minAge,
      maxAge: maxAge,
      minWeight: minWeight,
      maxWeight: maxWeight,
      onlyActive: onlyActive,
    ).map(
      (listWithInfo) => listWithInfo.map(StudentsMapper.fromData).toList()
    );
  }

  @override
  Future<StudentsEntity?> getByIdentification(String number) async {
    final data = await studentsDao.getStudentByIdentify(number);
    if (data == null) return null;
    return StudentsMapper.fromData(data);
  }

  @override
  Future<StudentsEntity?> getById(int id) async {
    final data = await studentsDao.getStudentById(id);
    if (data == null) return null;
    return StudentsMapper.fromData(data);
  }
  
}
