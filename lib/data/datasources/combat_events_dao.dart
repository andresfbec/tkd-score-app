import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';

class CombatEventsDao {
  final AppDatabase _db;

  CombatEventsDao(this._db);

  /// Inserta un nuevo evento de combate y retorna su ID
  Future<int> insert(CombatEventsCompanion row) async {
    return _db.into(_db.combatEvents).insert(row);
  }

  /// Inserta múltiples eventos de combate en una sola transacción
  Future<void> insertBatch(List<CombatEventsCompanion> rows) async {
    await _db.batch((batch) {
      batch.insertAll(_db.combatEvents, rows);
    });
  }

  /// Actualiza un evento de combate existente
  Future<bool> update(CombatEventsCompanion row) async {
    if (!row.id.present) {
      throw ArgumentError('ID requerido para update');
    }

    final rowsAffected = await (_db.update(_db.combatEvents)
          ..where((tbl) => tbl.id.equals(row.id.value)))
        .write(row);

    return rowsAffected > 0;
  }

  /// Elimina un evento de combate (soft delete)
  Future<int> delete(int pk) async {
    return await (_db.update(_db.combatEvents)
          ..where((tbl) => tbl.id.equals(pk)))
        .write(const CombatEventsCompanion(isActive: Value(0)));
  }

  /// Obtiene un evento de combate por su ID
  Future<CombatEvent?> getById(int id) async {
    final query = _db.select(_db.combatEvents)
      ..where((tbl) => tbl.id.equals(id) & tbl.isActive.equals(1));
    return await query.getSingleOrNull();
  }

  /// Obtiene todos los eventos válidos de una ronda de combate
  Future<List<CombatEvent>> getByRoundId(int roundId) async {
    final query = _db.select(_db.combatEvents)
      ..where((tbl) =>
          tbl.roundId.equals(roundId) &
          tbl.isValid.equals(1) &
          tbl.isActive.equals(1))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.createdAt)]);
    return await query.get();
  }

  /// Obtiene todos los eventos (incluidos los invalidados) de una ronda de combate
  Future<List<CombatEvent>> getAllByRoundId(int roundId) async {
    final query = _db.select(_db.combatEvents)
      ..where((tbl) => tbl.roundId.equals(roundId) & tbl.isActive.equals(1))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.createdAt)]);
    return await query.get();
  }

  /// Observa los eventos válidos de una ronda de combate en tiempo real
  Stream<List<CombatEvent>> watchByRoundId(int roundId) {
    final query = _db.select(_db.combatEvents)
      ..where((tbl) =>
          tbl.roundId.equals(roundId) &
          tbl.isValid.equals(1) &
          tbl.isActive.equals(1))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.createdAt)]);
    return query.watch();
  }

  /// Invalida un evento de combate (audit trail: no se elimina, se marca como inválido)
  Future<bool> invalidateEvent(int eventId, {required String reason}) async {
    final rowsAffected = await (_db.update(_db.combatEvents)
          ..where((tbl) => tbl.id.equals(eventId)))
        .write(CombatEventsCompanion(
          isValid: const Value(0),
          invalidatedAt: Value(DateTime.now()),
          invalidationReason: Value(reason),
          updatedAt: Value(DateTime.now()),
        ));
    return rowsAffected > 0;
  }

  /// Registra un evento de corrección que reemplaza a otro evento
  Future<int> insertCorrection({
    required int roundId,
    required int pointTypeId,
    required String targetParticipant,
    required double pointsDelta,
    double? matchSeconds,
    int? registeredByJudgeId,
    required int replacesEventId,
  }) async {
    // Primero invalidar el evento original
    await invalidateEvent(replacesEventId, reason: 'Corregido por nuevo evento');

    // Luego insertar el evento de corrección
    return insert(CombatEventsCompanion.insert(
      roundId: roundId,
      pointTypeId: pointTypeId,
      targetParticipant: targetParticipant,
      pointsDelta: pointsDelta,
      matchSeconds: matchSeconds != null ? Value(matchSeconds) : const Value.absent(),
      registeredByJudgeId: registeredByJudgeId != null ? Value(registeredByJudgeId) : const Value.absent(),
      replacesEventId: Value(replacesEventId),
    ));
  }

  /// Calcula los puntos totales válidos de una ronda para cada participante
  Future<Map<String, double>> calculateRoundPoints(int roundId) async {
    final events = await getByRoundId(roundId);
    final points = <String, double>{};

    for (final event in events) {
      points[event.targetParticipant] =
          (points[event.targetParticipant] ?? 0) + event.pointsDelta;
    }

    return points;
  }

  /// Elimina todos los eventos asociados a una ronda de combate (soft delete)
  Future<void> deleteAllByRound(int roundId) async {
    await (_db.update(_db.combatEvents)
          ..where((tbl) => tbl.roundId.equals(roundId)))
        .write(const CombatEventsCompanion(isActive: Value(0)));
  }
}
