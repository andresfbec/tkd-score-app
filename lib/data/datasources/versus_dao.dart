import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';

class VersusDao {
  final AppDatabase _db;

  VersusDao(this._db);

  /// Inserta un nuevo versus y retorna su ID
  Future<int> insert(VersusCompanion row) async {
    return _db.into(_db.versus).insert(row);
  }

  /// Inserta múltiples versus en una sola transacción
  Future<void> insertBatch(List<VersusCompanion> rows) async {
    await _db.batch((batch) {
      batch.insertAll(_db.versus, rows);
    });
  }

  /// Actualiza un versus existente
  Future<bool> update(VersusCompanion row) async {
    if (!row.id.present) {
      throw ArgumentError('ID requerido para update');
    }

    final rowsAffected = await (_db.update(_db.versus)
          ..where((tbl) => tbl.id.equals(row.id.value)))
        .write(row);

    return rowsAffected > 0;
  }

  /// Elimina un versus (soft delete)
  Future<int> delete(int pk) async {
    return await (_db.update(_db.versus)
          ..where((tbl) => tbl.id.equals(pk)))
        .write(const VersusCompanion(isActive: Value(0)));
  }

  /// Elimina todos los versus de un grupo específico (soft delete)
  Future<void> deleteAllByGroup(int groupId) async {
    await (_db.update(_db.versus)
          ..where((tbl) => tbl.groupId.equals(groupId)))
        .write(const VersusCompanion(isActive: Value(0)));
  }

  /// Obtiene un versus por su ID
  Future<VersusData?> getById(int id) async {
    final query = _db.select(_db.versus)
      ..where((tbl) => tbl.id.equals(id) & tbl.isActive.equals(1));
    return await query.getSingleOrNull();
  }

  /// Obtiene todos los versus de un grupo
  Future<List<VersusData>> getByGroupId(int groupId) async {
    final query = _db.select(_db.versus)
      ..where((tbl) => tbl.groupId.equals(groupId) & tbl.isActive.equals(1))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.bracketRound), (tbl) => OrderingTerm.asc(tbl.bracketOrder)]);
    return await query.get();
  }

  /// Obtiene todos los versus de un grupo para una ronda específica del bracket
  Future<List<VersusData>> getByGroupAndRound(int groupId, int bracketRound) async {
    final query = _db.select(_db.versus)
      ..where((tbl) =>
          tbl.groupId.equals(groupId) &
          tbl.bracketRound.equals(bracketRound) &
          tbl.isActive.equals(1))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.bracketOrder)]);
    return await query.get();
  }

  /// Obtiene todos los versus de un torneo
  Future<List<VersusData>> getByTournamentId(int tournamentId) async {
    final query = _db.select(_db.versus)
      ..where((tbl) => tbl.tournamentId.equals(tournamentId) & tbl.isActive.equals(1))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.bracketRound), (tbl) => OrderingTerm.asc(tbl.bracketOrder)]);
    return await query.get();
  }

  /// Observa los versus de un grupo con ordenamiento por ronda y orden
  Stream<List<VersusData>> watchByGroupId(int groupId) {
    final query = _db.select(_db.versus)
      ..where((tbl) => tbl.groupId.equals(groupId) & tbl.isActive.equals(1))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.bracketRound), (tbl) => OrderingTerm.asc(tbl.bracketOrder)]);
    return query.watch();
  }

  /// Observa los versus de un grupo filtrados por ronda del bracket
  Stream<List<VersusData>> watchByGroupAndRound(int groupId, int bracketRound) {
    final query = _db.select(_db.versus)
      ..where((tbl) =>
          tbl.groupId.equals(groupId) &
          tbl.bracketRound.equals(bracketRound) &
          tbl.isActive.equals(1))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.bracketOrder)]);
    return query.watch();
  }

  /// Actualiza el estado de un versus (ej: pending, in_progress, completed)
  Future<bool> updateState(int versusId, String state) async {
    final rowsAffected = await (_db.update(_db.versus)
          ..where((tbl) => tbl.id.equals(versusId)))
        .write(VersusCompanion(
          state: Value(state),
          updatedAt: Value(DateTime.now()),
        ));
    return rowsAffected > 0;
  }

  /// Establece el ganador de un versus
  Future<bool> setWinner(int versusId, int winnerInscriptionId) async {
    final rowsAffected = await (_db.update(_db.versus)
          ..where((tbl) => tbl.id.equals(versusId)))
        .write(VersusCompanion(
          winnerInscriptionId: Value(winnerInscriptionId),
          state: const Value('completed'),
          updatedAt: Value(DateTime.now()),
        ));
    return rowsAffected > 0;
  }

  /// Intercambia las inscripciones entre dos versus (para Drag & Drop)
  /// Usado en la fase de configuración para reordenar participantes
  Future<void> swapParticipants({
    required int versusIdA,
    required String slotA, // 'a' o 'b'
    required int versusIdB,
    required String slotB, // 'a' o 'b'
  }) async {
    await _db.transaction(() async {
      final vsA = await getById(versusIdA);
      final vsB = await getById(versusIdB);
      if (vsA == null || vsB == null) return;

      final inscriptionFromA = slotA == 'a' ? vsA.inscriptionAId : vsA.inscriptionBId;
      final inscriptionFromB = slotB == 'a' ? vsB.inscriptionAId : vsB.inscriptionBId;

      // Actualizar el slot de A con el valor de B
      await (_db.update(_db.versus)..where((tbl) => tbl.id.equals(versusIdA)))
          .write(slotA == 'a'
              ? VersusCompanion(inscriptionAId: Value(inscriptionFromB), updatedAt: Value(DateTime.now()))
              : VersusCompanion(inscriptionBId: Value(inscriptionFromB), updatedAt: Value(DateTime.now())));

      // Actualizar el slot de B con el valor de A
      await (_db.update(_db.versus)..where((tbl) => tbl.id.equals(versusIdB)))
          .write(slotB == 'a'
              ? VersusCompanion(inscriptionAId: Value(inscriptionFromA), updatedAt: Value(DateTime.now()))
              : VersusCompanion(inscriptionBId: Value(inscriptionFromA), updatedAt: Value(DateTime.now())));
    });
  }

  /// Verifica si todos los versus de una ronda en un grupo están completados
  Future<bool> isRoundComplete(int groupId, int bracketRound) async {
    final matches = await getByGroupAndRound(groupId, bracketRound);
    return matches.isNotEmpty && matches.every((m) => m.state == 'completed');
  }

  /// Obtiene el número máximo de rondas de bracket para un grupo
  Future<int> getMaxBracketRound(int groupId) async {
    final query = _db.selectOnly(_db.versus)
      ..addColumns([_db.versus.bracketRound.max()])
      ..where(_db.versus.groupId.equals(groupId) & _db.versus.isActive.equals(1));
    final result = await query.getSingle();
    return result.read(_db.versus.bracketRound.max()) ?? 0;
  }
}
