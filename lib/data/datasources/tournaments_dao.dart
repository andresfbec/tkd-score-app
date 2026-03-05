import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class TournamentsDao {
  final Database db;

  TournamentsDao(this.db);

  Future<int> insert({
    required String name,
    required String location,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String status,
  }) async {
    return await db.insert('tournaments', {
      'name': name,
      'location': location,
      'date_start': dateStart.toIso8601String(),
      'date_end': dateEnd.toIso8601String(),
      'status': status,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future<int> update({
    required int id,
    required String name,
    required String location,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String status,
  }) async {
    return await db.update(
      'tournaments',
      {
        'name': name,
        'location': location,
        'date_start': dateStart.toIso8601String(),
        'date_end': dateEnd.toIso8601String(),
        'status': status,
        'updatedAt': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    return await db.delete(
      'tournaments',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
  }) async {
    return await db.query(
      'tournaments',
      limit: limit,
      offset: offset,
      orderBy: orderBy,
    );
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

  Future<List<Map<String, dynamic>>> findByStatus(String status) async {
    return await db.query(
      'tournaments',
      where: 'status = ?',
      whereArgs: [status],
    );
  }

  Future<List<Map<String, dynamic>>> findUpcoming() async {
    final now = DateTime.now().toIso8601String();

    return await db.query(
      'tournaments',
      where: 'date_start > ?',
      whereArgs: [now],
      orderBy: 'date_start ASC',
    );
  }

  Future<List<Map<String, dynamic>>> findInProgress() async {
    final now = DateTime.now().toIso8601String();

    return await db.query(
      'tournaments',
      where: 'date_start <= ? AND date_end >= ?',
      whereArgs: [now, now],
    );
  }
}
