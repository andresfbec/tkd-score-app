import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';

class JudgesDao {
  final AppDatabase _db;

  JudgesDao(this._db);

  Future<int> insert(JudgeCompanion entry) async {
    return await _db.into(_db.judge).insert(entry);
  }

  Future<bool> update(JudgeCompanion entry) async {
    if (!entry.id.present) {
      throw ArgumentError('ID requerido para actualización');
    }
    return await (_db.update(_db.judge)
          ..where((tbl) => tbl.id.equals(entry.id.value)))
        .write(entry) > 0;
  }

  Future<int> delete(int id) async {
    // Borrado lógico siguiendo el estándar del proyecto
    return await (_db.update(_db.judge)..where((tbl) => tbl.id.equals(id)))
        .write(const JudgeCompanion(isActive: Value(0)));
  }

  Stream<List<JudgeData>> watchJudges({bool onlyActive = true}) {
    final query = _db.select(_db.judge);
    if (onlyActive) {
      query.where((tbl) => tbl.isActive.equals(1));
    }
    return query.watch();
  }

  Future<JudgeData?> getJudgeById(int id) async {
    return await (_db.select(_db.judge)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  // --- Relación con Torneos ---

  Future<int> assignToTournament(int judgeId, int tournamentId) async {
    return await _db.into(_db.judgeTournament).insert(
          JudgeTournamentCompanion(
            judgeId: Value(judgeId),
            tournamentId: Value(tournamentId),
          ),
        );
  }

  Future<int> removeFromTournament(int judgeId, int tournamentId) async {
    return await (_db.delete(_db.judgeTournament)
          ..where((tbl) =>
              tbl.judgeId.equals(judgeId) &
              tbl.tournamentId.equals(tournamentId)))
        .go();
  }

  Stream<List<JudgeData>> watchJudgesByTournament(int tournamentId) {
    final query = _db.select(_db.judge).join([
      innerJoin(
        _db.judgeTournament,
        _db.judgeTournament.judgeId.equalsExp(_db.judge.id),
      ),
    ])
      ..where(_db.judgeTournament.tournamentId.equals(tournamentId))
      ..where(_db.judge.isActive.equals(1));

    return query.watch().map((rows) {
      return rows.map((row) => row.readTable(_db.judge)).toList();
    });
  }
}
