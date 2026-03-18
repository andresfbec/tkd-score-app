import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../domain/entities/belts_entity.dart';

class BeltsDao {
  final Database db;

  BeltsDao(this.db);

  Future<int> insert({
    required String name,
    required String description,
  }) async {
    return await db.insert('belts', {
      'name': name,
      'description': description,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future<int> update(BeltsEntity belt) async {
    return await db.update(
      'belts',
      {'name': belt.name, 'updatedAt': DateTime.now().toIso8601String()},
      where: 'id = ?',
      whereArgs: [belt.id],
    );
  }

  Future<int> delete(int pk) async {
    return await db.delete('belts', where: 'id = ?', whereArgs: [pk]);
  }

  Future<List<Map<String, dynamic>>> findAll() async {
    return await db.query('belts');
  }

  Future<Map<String, dynamic>?> findById(int pk) async {
    final result = await db.query('belts', where: 'id = ?', whereArgs: [pk]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }
}
