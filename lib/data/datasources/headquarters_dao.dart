import 'package:drift/drift.dart';
import '../../core/constants/fields.dart';
import '../../core/config/db/database.dart';

class HeadquartersDao {
  final AppDatabase _db;

  HeadquartersDao(this._db);

  Future<int> insert(HeadquartersCompanion hq) async {
    return _db.into(_db.headquarters).insert(hq);
  }

  Future<bool> update(HeadquartersCompanion hq) async {
    return _db
        .update(_db.headquarters)
        .replace(hq.copyWith(id: Value(hq.id.value)));
  }

  Future<int> delete(int pk) async {
    return await (_db.update(_db.headquarters)
          ..where((tbl) => tbl.id.equals(pk)))
        .write(const HeadquartersCompanion(isActive: Value(0)));
  }

  Future<List<Headquarter>> findAll() async {
    // Versión simplificada sin .where primero para probar
    final all = await _db.select(_db.headquarters).get();

    // Filtrar manualmente (solo para prueba)
    final active = all.where((hq) => hq.isActive == 1).toList();

    return active;
  }

  Future<Headquarter?> findById(int pk) async {
    final result =
        await (_db.select(_db.headquarters)
              ..where((tbl) => tbl.id.equals(pk) & tbl.isActive.equals(1)))
            .getSingleOrNull();

    return result; // Devolvemos el objeto Headquarter o null si no existe
  }

  Future<List<Headquarter>> query({required HeadquarterFilter filter}) async {
    if (filter.id == null &&
        filter.name == null &&
        filter.city == null &&
        filter.address == null) {
      throw ArgumentError('Debe proporcionar al menos un filtro');
    }

    final query = _db.select(_db.headquarters);

    query.where((tbl) {
      Expression<bool>? predicate;

      if (filter.id != null) {
        predicate = tbl.id.equals(filter.id!);
      }

      if (filter.name != null) {
        final condition = tbl.name.equals(filter.name!);
        predicate = predicate == null ? condition : predicate & condition;
      }

      if (filter.city != null) {
        final condition = tbl.city.equals(filter.city!);
        predicate = predicate == null ? condition : predicate & condition;
      }

      if (filter.address != null) {
        final condition = tbl.address.equals(filter.address!);
        predicate = predicate == null ? condition : predicate & condition;
      }

      // agregar condición de activo
      final activeCondition = tbl.isActive.equals(1);
      predicate = predicate == null
          ? activeCondition
          : predicate & activeCondition;

      return predicate;
    });

    return await query.get();
  }
}
