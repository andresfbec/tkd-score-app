import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';
import '../../domain/entities/inscriptions_entity.dart';

class InscriptionsDao {
  final AppDatabase _db;

  InscriptionsDao(this._db);

  /// Inserta una nueva inscripción y retorna su ID
  Future<int> insert(InscriptionCompanion row) async {
    return _db.into(_db.inscription).insert(row);
  }

  /// Actualiza una inscripción existente
  Future<bool> update(InscriptionCompanion row) async {
    if (!row.id.present) {
      throw ArgumentError('ID requerido para update');
    }

    final rowsAffected = await (_db.update(_db.inscription)
          ..where((tbl) => tbl.id.equals(row.id.value)))
        .write(row);

    return rowsAffected > 0;
  }

  /// Cambia el grupo de todas las inscripciones que estaban en un grupo anterior a uno nuevo
  Future<void> updateInscriptionsGroup(int oldGroupId, int newGroupId) async {
    await (_db.update(_db.inscription)
          ..where((tbl) => tbl.groupId.equals(oldGroupId)))
        .write(InscriptionCompanion(groupId: Value(newGroupId)));
  }

  /// Establece el grupo de una inscripción específica
  Future<void> setGroupId(int inscriptionId, int? groupId) async {
    await (_db.update(_db.inscription)
          ..where((tbl) => tbl.id.equals(inscriptionId)))
        .write(InscriptionCompanion(groupId: Value(groupId)));
  }

  /// Elimina una inscripción (Soft delete marcándola como inactiva)
  Future<int> delete(int pk) async {
    return await (_db.update(_db.inscription)
          ..where((tbl) => tbl.id.equals(pk)))
        .write(const InscriptionCompanion(isActive: Value(0)));
  }

  /// Super método para observar inscripciones con información completa (estudiante, torneo, grupo)
  /// Permite filtrar por torneo, estudiante o grupo.
  Stream<List<InscriptionsEntity>> watchInscriptions({
    int? tournamentId,
    int? studentId,
    int? groupId,
    bool onlyActive = true,
  }) {
    final query = _db.select(_db.inscription).join([
      innerJoin(
        _db.students,
        _db.students.id.equalsExp(_db.inscription.studentId),
      ),
      innerJoin(
        _db.tournament,
        _db.tournament.id.equalsExp(_db.inscription.tournamentId),
      ),
      leftOuterJoin(
        _db.groups,
        _db.groups.id.equalsExp(_db.inscription.groupId),
      ),
      leftOuterJoin(
        _db.belts,
        _db.belts.id.equalsExp(_db.students.beltId),
      ),
      leftOuterJoin(
        _db.headquarters,
        _db.headquarters.id.equalsExp(_db.students.headquarterId),
      ),
    ]);

    if (tournamentId != null) {
      query.where(_db.inscription.tournamentId.equals(tournamentId));
    }
    if (studentId != null) {
      query.where(_db.inscription.studentId.equals(studentId));
    }
    if (groupId != null) {
      query.where(_db.inscription.groupId.equals(groupId));
    }

    if (onlyActive) {
      query.where(_db.inscription.isActive.equals(1));
    }

    return query.watch().map((rows) {
      return rows.map((row) => _mapToEntity(row)).toList();
    });
  }

  /// Obtener todas las inscripciones activas de un torneo con toda la info de joins
  Future<List<InscriptionsEntity>> getInscriptionsByTournament(int tournamentId) async {
    final query = _db.select(_db.inscription).join([
      innerJoin(
        _db.students,
        _db.students.id.equalsExp(_db.inscription.studentId),
      ),
      innerJoin(
        _db.tournament,
        _db.tournament.id.equalsExp(_db.inscription.tournamentId),
      ),
      leftOuterJoin(
        _db.groups,
        _db.groups.id.equalsExp(_db.inscription.groupId),
      ),
      leftOuterJoin(
        _db.belts,
        _db.belts.id.equalsExp(_db.students.beltId),
      ),
      leftOuterJoin(
        _db.headquarters,
        _db.headquarters.id.equalsExp(_db.students.headquarterId),
      ),
    ])
      ..where(_db.inscription.tournamentId.equals(tournamentId) & _db.inscription.isActive.equals(1));

    final rows = await query.get();
    return rows.map((row) => _mapToEntity(row)).toList();
  }

  /// Obtener una inscripción por su ID con toda la info de joins
  Future<InscriptionsEntity?> getById(int id) async {
    final query = _db.select(_db.inscription).join([
      innerJoin(_db.students, _db.students.id.equalsExp(_db.inscription.studentId)),
      innerJoin(_db.tournament, _db.tournament.id.equalsExp(_db.inscription.tournamentId)),
      leftOuterJoin(_db.groups, _db.groups.id.equalsExp(_db.inscription.groupId)),
      leftOuterJoin(_db.belts, _db.belts.id.equalsExp(_db.students.beltId)),
    ])
      ..where(_db.inscription.id.equals(id));

    final row = await query.getSingleOrNull();
    return row != null ? _mapToEntity(row) : null;
  }

  InscriptionsEntity _mapToEntity(TypedResult row) {
    final inscription = row.readTable(_db.inscription);
    final student = row.readTable(_db.students);
    final tournament = row.readTable(_db.tournament);
    final group = row.readTableOrNull(_db.groups);
    final belt = row.readTableOrNull(_db.belts);
    final headquarters = row.readTableOrNull(_db.headquarters);

    return InscriptionsEntity(
      id: inscription.id,
      date: inscription.date,
      studentId: inscription.studentId,
      tournamentId: inscription.tournamentId,
      groupId: inscription.groupId,
      studentNames: student.names,
      studentSurnames: student.surnames,
      studentWeight: student.weightKg,
      studentBirthDate: student.birthDate,
      studentBeltName: belt?.name,
      headquartersName: headquarters?.name,
      tournamentName: tournament.name,
      groupName: group?.name,
    );
  }
}
