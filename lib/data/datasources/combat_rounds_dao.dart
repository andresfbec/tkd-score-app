import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';

class CombatRoundsDao {
  final AppDatabase _db;

  CombatRoundsDao(this._db);

  /// Inserta una nueva ronda de combate y retorna su ID
  Future<int> insert(CombatRoundsCompanion row) async {
    return _db.into(_db.combatRounds).insert(row);
  }

  /// Inserta múltiples rondas de combate en una sola transacción
  Future<void> insertBatch(List<CombatRoundsCompanion> rows) async {
    await _db.batch((batch) {
      batch.insertAll(_db.combatRounds, rows);
    });
  }

  /// Actualiza una ronda de combate existente
  Future<bool> update(CombatRoundsCompanion row) async {
    if (!row.id.present) {
      throw ArgumentError('ID requerido para update');
    }

    final rowsAffected = await (_db.update(_db.combatRounds)
          ..where((tbl) => tbl.id.equals(row.id.value)))
        .write(row);

    return rowsAffected > 0;
  }

  /// Elimina una ronda de combate (soft delete)
  Future<int> delete(int pk) async {
    return await (_db.update(_db.combatRounds)
          ..where((tbl) => tbl.id.equals(pk)))
        .write(const CombatRoundsCompanion(isActive: Value(0)));
  }

  /// Obtiene una ronda de combate por su ID
  Future<CombatRound?> getById(int id) async {
    final query = _db.select(_db.combatRounds)
      ..where((tbl) => tbl.id.equals(id) & tbl.isActive.equals(1));
    return await query.getSingleOrNull();
  }

  /// Obtiene todas las rondas de combate de un versus
  Future<List<CombatRound>> getByVersusId(int versusId) async {
    final query = _db.select(_db.combatRounds)
      ..where((tbl) => tbl.versusId.equals(versusId) & tbl.isActive.equals(1))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.roundNumber)]);
    return await query.get();
  }

  /// Observa las rondas de combate de un versus
  Stream<List<CombatRound>> watchByVersusId(int versusId) {
    final query = _db.select(_db.combatRounds)
      ..where((tbl) => tbl.versusId.equals(versusId) & tbl.isActive.equals(1))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.roundNumber)]);
    return query.watch();
  }

  /// Actualiza el estado de una ronda de combate (ej: pending, in_progress, completed)
  Future<bool> updateState(int roundId, String state) async {
    final rowsAffected = await (_db.update(_db.combatRounds)
          ..where((tbl) => tbl.id.equals(roundId)))
        .write(CombatRoundsCompanion(
          state: Value(state),
          updatedAt: Value(DateTime.now()),
        ));
    return rowsAffected > 0;
  }

  /// Actualiza los puntos de una ronda de combate
  Future<bool> updatePoints(int roundId, {required int pointsA, required int pointsB}) async {
    final rowsAffected = await (_db.update(_db.combatRounds)
          ..where((tbl) => tbl.id.equals(roundId)))
        .write(CombatRoundsCompanion(
          pointsA: Value(pointsA),
          pointsB: Value(pointsB),
          updatedAt: Value(DateTime.now()),
        ));
    return rowsAffected > 0;
  }

  /// Establece el ganador de una ronda de combate y marca como completada
  Future<bool> setWinner(int roundId, int winnerInscriptionId) async {
    final rowsAffected = await (_db.update(_db.combatRounds)
          ..where((tbl) => tbl.id.equals(roundId)))
        .write(CombatRoundsCompanion(
          winnerInscriptionId: Value(winnerInscriptionId),
          state: const Value('completed'),
          endAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ));
    return rowsAffected > 0;
  }

  /// Verifica si todas las rondas de combate de un versus están completadas
  Future<bool> areAllRoundsComplete(int versusId) async {
    final rounds = await getByVersusId(versusId);
    return rounds.isNotEmpty && rounds.every((r) => r.state == 'completed');
  }

  /// Obtiene la ronda de combate activa (en progreso) de un versus
  Future<CombatRound?> getActiveRound(int versusId) async {
    final query = _db.select(_db.combatRounds)
      ..where((tbl) =>
          tbl.versusId.equals(versusId) &
          tbl.state.equals('in_progress') &
          tbl.isActive.equals(1));
    return await query.getSingleOrNull();
  }

  /// Elimina todas las rondas de combate asociadas a un versus (soft delete)
  Future<void> deleteAllByVersus(int versusId) async {
    await (_db.update(_db.combatRounds)
          ..where((tbl) => tbl.versusId.equals(versusId)))
        .write(const CombatRoundsCompanion(isActive: Value(0)));
  }
}
