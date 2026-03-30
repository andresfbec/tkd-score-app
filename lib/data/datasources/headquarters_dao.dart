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
    // actualiza solo los campos que se proporcionan en el companion
    if (!hq.id.present) {
      // valida que el ID esté presente para actualizar
      throw ArgumentError('ID requerido para update');
    }

    final rowsAfected = await (_db.update(
      _db.headquarters,
    )..where((tbl) => tbl.id.equals(hq.id.value))).write(hq);

    return rowsAfected > 0; // true si se actualizó al menos una fila
  }

  Future<int> delete(int pk) async {
    return await (_db.update(_db.headquarters)
          ..where((tbl) => tbl.id.equals(pk)))
        .write(const HeadquartersCompanion(isActive: Value(0)));
  }

  Future<List<Headquarter>> findAll() async {
    // mejora en find all filtra en bd y no en memoria
    return await (_db.select(
      _db.headquarters,
    )..where((tbl) => tbl.isActive.equals(1))).get();
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
      final conditions = <Expression<bool>>[];

      if (filter.id != null) {
        conditions.add(tbl.id.equals(filter.id!));
      }

      if (filter.name != null) {
        conditions.add(tbl.name.equals(filter.name!));
      }

      if (filter.city != null) {
        conditions.add(tbl.city.equals(filter.city!));
      }

      if (filter.address != null) {
        conditions.add(tbl.address.equals(filter.address!));
      }

      // agregar condición de activo
      final activeCondition = tbl.isActive.equals(1);
      conditions.add(activeCondition);

      return conditions.length == 1
          ? conditions.first
          : conditions.reduce((a, b) => a & b);
    });

    return await query
        .get(); // devuelve la lista de sedes que cumplen si no hay devuelve vacia
  }

  Stream<List<Headquarter>> watchAll() { // Escucha cambios en la tabla y emite la lista actualizada de sedes activas
    return (_db.select(
      _db.headquarters,
    )..where((tbl) => tbl.isActive.equals(1))).watch();
  }
}
