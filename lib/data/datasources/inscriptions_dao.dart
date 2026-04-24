import 'package:drift/drift.dart';
import '../../core/constants/fields.dart';
import '../../core/config/db/database.dart';
import '../../core/utils/inscription_model_info.dart';

class InscriptionsDao {
  final AppDatabase _db;

  InscriptionsDao(this._db);

  Future<int> insert(InscriptionCompanion row) async {
    return _db.into(_db.inscription).insert(row);
  }

  Future<bool> update(InscriptionCompanion row) async {
    if (!row.id.present) {
      throw ArgumentError('ID requerido para update');
    }

    final rowsAffected = await (_db.update(_db.inscription)
          ..where((tbl) => tbl.id.equals(row.id.value)))
        .write(row);

    return rowsAffected > 0;
  }

  Future<int> delete(int pk) async {
    // Soft delete: marcamos como inactivo
    return await (_db.update(_db.inscription)
          ..where((tbl) => tbl.id.equals(pk)))
        .write(const InscriptionCompanion(isActive: Value(0)));
  }

  /// Super método para observar inscripciones con información completa (estudiante, torneo, grupo)
  /// Permite filtrar por torneo, estudiante o grupo.
  Stream<List<InscriptionWithInfo>> watchInscriptions({
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
      return rows.map((row) {
        return InscriptionWithInfo(
          inscription: row.readTable(_db.inscription),
          student: row.readTable(_db.students),
          tournament: row.readTable(_db.tournament),
          group: row.readTableOrNull(_db.groups),
        );
      }).toList();
    });
  }

  /// Obtener una inscripción específica por su ID con toda su información relacionada
  Future<InscriptionWithInfo?> getInscriptionById(int id) async {
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
    ])
      ..where(_db.inscription.id.equals(id));

    final row = await query.getSingleOrNull();

    if (row == null) return null;

    return InscriptionWithInfo(
      inscription: row.readTable(_db.inscription),
      student: row.readTable(_db.students),
      tournament: row.readTable(_db.tournament),
      group: row.readTableOrNull(_db.groups),
    );
  }

  /// Obtener todas las inscripciones activas de un torneo
  Future<List<InscriptionWithInfo>> getInscriptionsByTournament(int tournamentId) async {
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
    ])
      ..where(_db.inscription.tournamentId.equals(tournamentId) & _db.inscription.isActive.equals(1));

    final rows = await query.get();

    return rows.map((row) {
      return InscriptionWithInfo(
        inscription: row.readTable(_db.inscription),
        student: row.readTable(_db.students),
        tournament: row.readTable(_db.tournament),
        group: row.readTableOrNull(_db.groups),
      );
    }).toList();
  }
}
