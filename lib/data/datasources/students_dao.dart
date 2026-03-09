import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../core/constants/fields.dart';
import '../../domain/entities/students_entity.dart';

class StudentsDao {
  final Database db;

  StudentsDao(this.db);

  Future<int> insert({
    required String names,
    required String surnames,
    String? typeDocument,
    String? documentNumber,
    int? age,
    String? gender,
    double? weight,
    double? size,
    int? headquarterId,
    int? beltsId,
  }) async {
    return await db.insert('students', {
      'names': names,
      'surnames': surnames,
      'type_identify': typeDocument,
      'number_id': documentNumber,
      'age': age,
      'gender': gender,
      'weight': weight,
      'size': size,
      'headquarterId': headquarterId,
      'beltsId': beltsId,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future<int> update(StudentsEntity student) async {
    return await db.update(
      'students',
      {
        'names': student.names,
        'surnames': student.surnames,
        'type_identify': student.typeDocument,
        'number_id': student.documentNumber,
        'age': student.age,
        'gender': student.gender,
        'weight': student.weight,
        'size': student.size,
        'headquarterId': student.headquarterId,
        'beltsId': student.beltsId,
        'updatedAt': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  Future<int> delete(int pk) async {
    return await db.delete('students', where: 'id = ?', whereArgs: [pk]);
  }

  Future<List<Map<String, dynamic>>> findAll() async {
    return await db.query('students');
  }

  Future<Map<String, dynamic>?> findById(int pk) async {
    final result = await db.query(
      'students',
      where: 'id = ?',
      whereArgs: [pk],
      limit: 1,
    );

    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String, dynamic>?> query({
    required Map<String, dynamic> filters,
  }) async {
    if (filters.isEmpty) {
      return null;
    }

    final whereClauses = <String>[];
    final whereArgs = <dynamic>[];

    for (final entry in filters.entries) {
      if (!DatabaseFields.students.contains(entry.key)) {
        throw ArgumentError('Campo no permitido: ${entry.key}');
      }
      whereClauses.add('${entry.key} = ?');
      whereArgs.add(entry.value);
    }
    final result = await db.query(
      'users',
      where: whereClauses.join(' AND '),
      whereArgs: whereArgs,
      limit: 1,
    );

    return result.isNotEmpty ? result.first : null;
  }
}
