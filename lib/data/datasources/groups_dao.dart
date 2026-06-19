import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';
import '../../domain/entities/groups_entity.dart';

class GroupsDao {
  final AppDatabase _db;

  GroupsDao(this._db);

  /// Inserta un nuevo grupo y retorna su ID
  Future<int> insert(GroupsCompanion row) async {
    return _db.into(_db.groups).insert(row);
  }

  /// Inserta múltiples grupos en una sola transacción
  Future<void> insertBatch(List<GroupsCompanion> rows) async {
    await _db.batch((batch) {
      batch.insertAll(_db.groups, rows);
    });
  }

  /// Actualiza un grupo existente
  Future<bool> update(GroupsCompanion row) async {
    if (!row.id.present) {
      throw ArgumentError('ID requerido para update');
    }

    final rowsAffected = await (_db.update(_db.groups)
          ..where((tbl) => tbl.id.equals(row.id.value)))
        .write(row);

    return rowsAffected > 0;
  }

  /// Elimina un grupo (Soft delete si isActive existe, si no, Hard delete)
  Future<int> delete(int pk) async {
    // Si la tabla groups tiene isActive, podrías hacer soft delete.
    // Pero por ahora, basándonos en el requerimiento de "eliminar", haremos hard delete o limpiaremos el estado.
    return await (_db.delete(_db.groups)..where((tbl) => tbl.id.equals(pk))).go();
  }

  /// Elimina todos los grupos de un torneo específico
  Future<void> deleteAllByTournament(int tournamentId) async {
    await (_db.delete(_db.groups)..where((tbl) => tbl.tournamentId.equals(tournamentId))).go();
  }

  /// Observa los grupos de un torneo, incluyendo el conteo de participantes mediante un join
  Stream<List<GroupsEntity>> watchGroups(int tournamentId) {
    final countExp = _db.inscription.id.count();

    final query = _db.select(_db.groups).join([
      leftOuterJoin(
        _db.inscription,
        _db.inscription.groupId.equalsExp(_db.groups.id) & _db.inscription.isActive.equals(1),
      )
    ])
      ..where(_db.groups.tournamentId.equals(tournamentId))
      ..groupBy([_db.groups.id]);

    query.addColumns([countExp]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final groupRow = row.readTable(_db.groups);
        final count = row.read(countExp) ?? 0;
        
        return GroupsEntity(
          id: groupRow.id,
          tournamentId: groupRow.tournamentId,
          name: groupRow.name,
          gender: groupRow.gender,
          ageMin: groupRow.ageMin,
          ageMax: groupRow.ageMax,
          weightMin: groupRow.weightMin,
          weightMax: groupRow.weightMax,
          beltFromId: groupRow.beltFromId,
          beltToId: groupRow.beltToId,
          state: groupRow.state,
          description: groupRow.description,
          isActive: groupRow.isActive,
          participantsCount: count,
        );
      }).toList();
    });
  }

  /// Obtiene todos los grupos de un torneo (sin Stream)
  Future<List<GroupsEntity>> getGroupsByTournament(int tournamentId) async {
    final query = _db.select(_db.groups)..where((tbl) => tbl.tournamentId.equals(tournamentId));
    final rows = await query.get();

    return rows.map((row) => _mapToEntity(row)).toList();
  }

  /// Obtiene un grupo por su ID
  Future<GroupsEntity?> getGroupById(int id) async {
    final query = _db.select(_db.groups)..where((tbl) => tbl.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToEntity(row) : null;
  }

  GroupsEntity _mapToEntity(Group row) {
    return GroupsEntity(
      id: row.id,
      tournamentId: row.tournamentId,
      name: row.name,
      gender: row.gender,
      ageMin: row.ageMin,
      ageMax: row.ageMax,
      weightMin: row.weightMin,
      weightMax: row.weightMax,
      beltFromId: row.beltFromId,
      beltToId: row.beltToId,
      state: row.state,
      description: row.description,
      isActive: row.isActive,
    );
  }
}
