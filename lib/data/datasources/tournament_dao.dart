import 'package:drift/drift.dart';

import '../../core/constants/fields.dart';
import '../../core/config/db/database.dart';

class TournamentDao {
  final AppDatabase _db;

  TournamentDao(this._db);

  Future<int> insert(TournamentCompanion row) async {
    return _db.into(_db.tournament).insert(row);
  }

  Future<bool> update(TournamentCompanion row) async {
    if (!row.id.present) {
      throw ArgumentError('ID requerido para update');
    }

    final rowsAffected = await (_db.update(_db.tournament)
          ..where((tbl) => tbl.id.equals(row.id.value)))
        .write(row);

    return rowsAffected > 0;
  }

  Future<int> delete(int pk) async {
    return await (_db.update(_db.tournament)
          ..where((tbl) => tbl.id.equals(pk)))
        .write(const TournamentCompanion(isActive: Value(0)));
  }

  Future<List<TournamentData>> findAll() async {
    return await (_db.select(_db.tournament)
          ..where((tbl) => tbl.isActive.equals(1)))
        .get();
  }

  Future<TournamentData?> findById(int pk) async {
    return await (_db.select(_db.tournament)
          ..where((tbl) => tbl.id.equals(pk) & tbl.isActive.equals(1)))
        .getSingleOrNull();
  }

  Future<List<TournamentData>> query({required TournamentFilter filter}) async {
    if (filter.id == null &&
        filter.name == null &&
        filter.location == null &&
        filter.status == null &&
        filter.dateStart == null) {
      throw ArgumentError('Debe proporcionar al menos un filtro');
    }

    final query = _db.select(_db.tournament);

    query.where((tbl) {
      final conditions = <Expression<bool>>[];

      if (filter.id != null) {
        conditions.add(tbl.id.equals(filter.id!));
      }
      if (filter.name != null) {
        conditions.add(tbl.name.equals(filter.name!));
      }
      if (filter.location != null) {
        conditions.add(tbl.location.equals(filter.location!));
      }
      if (filter.status != null) {
        conditions.add(tbl.status.equals(filter.status!));
      }
      if (filter.dateStart != null) {
        conditions.add(tbl.dateStart.equals(filter.dateStart!));
      }

      conditions.add(tbl.isActive.equals(1));

      return conditions.length == 1
          ? conditions.first
          : conditions.reduce((a, b) => a & b);
    });

    return await query.get();
  }

  Stream<List<TournamentData>> watchAll() {
    return (_db.select(_db.tournament)
          ..where((tbl) => tbl.isActive.equals(1)))
        .watch();
  }
}
