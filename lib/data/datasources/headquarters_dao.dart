import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class HeadquartersDao {
  final Database db;

  HeadquartersDao(this.db);

  // insercion de sede 
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

  // obtener todas las sedes
  Future<List<Map<String, dynamic>>> findAll() async {
    return await db.query('headquarters');
  }

  // obtener sede por id 
  Future<Map<String, dynamic>?> findById(int id) async {
    final result = await db.query(
      'headquarters',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    return result.isNotEmpty ? result.first : null;
  }

  // eliminar sede por id
  Future<int> deleteById(int id) async {
    return await db.delete(
      'headquarters',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // actualizar sede por id
  Future<int> updateById({
    required int id,
    required String name,
    required String address,
    required String city,
    required String phone,
  }) async {
    return await db.update(
      'headquarters',
      {
        'name': name,
        'address': address,
        'city': city,
        'phone': phone,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
