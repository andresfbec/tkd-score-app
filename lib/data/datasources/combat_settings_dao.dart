import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';

class CombatSettingsDao {
  final AppDatabase _db;

  CombatSettingsDao(this._db);

  Future<int> insert(CombatSettingsCompanion companion) async {
    return _db.into(_db.combatSettings).insert(companion);
  }

  Future<bool> update(CombatSettingsCompanion companion) async {
    if (!companion.id.present) {
      throw ArgumentError('ID requerido para update');
    }

    final rowsAfected = await (_db.update(
      _db.combatSettings,
    )..where((tbl) => tbl.id.equals(companion.id.value))).write(companion);

    return rowsAfected > 0; // true si se actualizó al menos una fila
  }

  Future<int> delete(int pk) async {
    return await (_db.update(_db.combatSettings)..where((tbl) => tbl.id.equals(pk)))
        .write(const CombatSettingsCompanion(isActive: Value(0)));
  }

  // Metodo para obtener configuraciones de combate y recibir parametros de filtramiento opcionales (una fuente unica de verdad)
  Stream<List<CombatSetting>> watchCombatSettings({
    int? tournamentId,
    String? formatType,
    String? eliminationType,
    bool? onlyActive,
  }) {
    final query = _db.select(_db.combatSettings);

    if (tournamentId != null) {
      query.where((tbl) => tbl.tournamentId.equals(tournamentId));
    }

    if (formatType != null && formatType.isNotEmpty) {
      query.where((tbl) => tbl.formatType.equals(formatType));
    }

    if (eliminationType != null && eliminationType.isNotEmpty) {
      query.where((tbl) => tbl.eliminationType.equals(eliminationType));
    }

    if (onlyActive != null) {
      query.where((tbl) => tbl.isActive.equals(onlyActive ? 1 : 0));
    } else {
      query.where((tbl) => tbl.isActive.equals(1)); // Por defecto activos
    }

    return query.watch();
  }

  Future<CombatSetting?> getCombatSettingByTournamentId(int tournamentId) async {
    final query = _db.select(_db.combatSettings)
      ..where((tbl) => tbl.tournamentId.equals(tournamentId));

    return await query.getSingleOrNull();
  }

  Future<CombatSetting?> getCombatSettingById(int id) async {
    final query = _db.select(_db.combatSettings)
      ..where((tbl) => tbl.id.equals(id));

    return await query.getSingleOrNull();
  }
}
