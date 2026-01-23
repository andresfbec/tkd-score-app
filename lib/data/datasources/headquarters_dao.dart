import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class HeadquartersDao {
  final Database db;

  HeadquartersDao(this.db);

  Future<int> insert({
    required String name,
    required String address,
    required String city,
    required String phone,
  }) async {
    return await db.insert(
      'headquarters',
      {
        'name': name,
        'address': address,
        'city': city,
        'phone': phone,
      },
    );
  }

  Future<List<Map<String, dynamic>>> findAll() async {
    return await db.query('headquarters');
  }

  Future<Map<String, dynamic>?> findById(int id) async {
    final result = await db.query(
      'headquarters',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    return result.isNotEmpty ? result.first : null;
  }
}
