import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../core/constants/fields.dart';

class UserDao {
  final Database db;

  UserDao(this.db);

  Future<int> insert({
    required String username,
    required String password,
    required int headquartersId,
  }) async {
    return await db.insert('users', {
      'username': username,
      'password': password,
      'headquarterId': headquartersId,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future<int> update({
    required int id,
    required String username,
    required String password,
    required int headquartersId,
  }) async {
    return await db.update(
      'users',
      {
        'username': username,
        'password': password,
        'headquarterId': headquartersId,
        'updatedAt': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int pk) async {
    return await db.delete('users', where: 'id = ?', whereArgs: [pk]);
  }

  Future<List<Map<String, dynamic>>> findAll() async {
    return await db.query('users');
  }

  Future<Map<String, dynamic>?> findById(int pk) async {
    final result = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [pk],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> getByUsername(String username) async {
    final result = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
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
      if (!fieldsUsers.contains(entry.key)) {
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
