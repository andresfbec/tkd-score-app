import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';

class UserDao {
  final AppDatabase _db;

  UserDao(this._db);

  Future<int> insert(UsersCompanion user) async {
    return _db.into(_db.users).insert(user);
  }

  Future<bool> update(UsersCompanion user) async {
    return _db
        .update(_db.users)
        .replace(user.copyWith(id: Value(user.id.value)));
  }

  Future<int> delete(int pk) async {
    return await (_db.update(_db.users)..where((tbl) => tbl.id.equals(pk)))
        .write(const UsersCompanion(isActive: Value(0)));
  }

  Future<List<User>> findAll() async {
    // Versión simplificada sin .where primero para probar
    final all = await _db.select(_db.users).get();

    // Filtrar manualmente (solo para prueba)
    final active = all.where((us) => us.isActive == 1).toList();

    return active;
  }

  Future<User?> findById(int pk) async {
    final result =
        await (_db.select(_db.users)
              ..where((tbl) => tbl.id.equals(pk) & tbl.isActive.equals(1)))
            .getSingleOrNull();

    return result; // Devolvemos el objeto Headquarter o null si no existe
  }

  Future<User?> getByUsername(String username) async {
    final result = await (_db.select(
      _db.users,
    )..where((tbl) => tbl.username.equals(username))).getSingleOrNull();
    return result;
  }

  Future<List<User>> getByheadquater(int idHeadquarte) async {
    final result = await (_db.select(
      _db.users,
    )..where((tbl) => tbl.headquarterId.equals(idHeadquarte))).get();

    return result;
  }
}
