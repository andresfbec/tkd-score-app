import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../core/constants/fields.dart';

class TournamentsDao {
  final Database db;

  TournamentsDao(this.db);

  Future<int> insert({
    required String name,
    required String description,
    required int headquartersId,
  }) async {
    return await db.insert('tournaments', {
      'name': name,
      'description': description,
      'headquartersId': headquartersId,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future<int> update({
    required int id,
    required String name,
    required String description,
    required int headquartersId,
  }) async {
    return await db.update(
      'tournaments',
      {
        'name': name,
        'description': description,
        'headquartersId': headquartersId,
        'updatedAt': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int pk) async {
    return await db.delete('tournaments', where: 'id = ?', whereArgs: [pk]);
  }

  Future<List<Map<String, dynamic>>> findAll() async {
    return await db.query('tournaments');
  }

  Future<Map<String, dynamic>?> findById(int id) async {
    final result = await db.query(
      'tournaments',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }
}
