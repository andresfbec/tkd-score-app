import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';
import '../../core/constants/tournament_lifecycle.dart';

import '../../domain/entities/tournament_entity.dart';
import '../../domain/repositories/tournament_repository.dart';
import '../datasources/tournament_dao.dart';
import '../datasources/combat_settings_dao.dart';
import '../mappers/tournament_mapper.dart';
import '../../core/constants/fields.dart';

class TournamentRepositoryImpl implements TournamentRepository {
  final TournamentDao dao;
  final CombatSettingsDao combatSettingsDao;

  TournamentRepositoryImpl(this.dao, this.combatSettingsDao);

  @override
  Future<int> create(TournamentEntity tournament) {
    final comp = TournamentMapper.toCompanion(tournament);
    return dao.insert(
      comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<bool> update(TournamentEntity tournament) {
    final comp = TournamentMapper.toCompanion(tournament);
    return dao.update(
      comp.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<int> delete(int id) {
    return dao.delete(id);
  }

  @override
  Future<List<TournamentEntity>> getAll() async {
    final result = await dao.findAll();
    return result.map(TournamentMapper.fromData).toList();
  }

  @override
  Future<TournamentEntity?> getById(int id) async {
    final row = await dao.findById(id);
    return row != null ? TournamentMapper.fromData(row) : null;
  }

  @override
  Future<List<TournamentEntity>> find({
    String? name,
    String? location,
    String? status,
    DateTime? dateStart,
  }) async {
    final data = await dao.query(
      filter: TournamentFilter(
        name: name,
        location: location,
        status: status,
        dateStart: dateStart,
      ),
    );
    return data.map(TournamentMapper.fromData).toList();
  }

  @override
  Stream<List<TournamentEntity>> watchAll() {
    return dao.watchAll().map(
          (data) => data.map(TournamentMapper.fromData).toList(),
        );
  }

  @override
  Future<void> syncSetupPhase(int tournamentId) async {
    final existing = await dao.findById(tournamentId);
    if (existing == null) return;

    final phase = TournamentLifecycle.normalize(existing.setupPhase);
    
    // Si ya está live o terminado, no tocamos nada
    if (phase == TournamentLifecycle.live || phase == TournamentLifecycle.finished) {
      return;
    }

    final settings = await combatSettingsDao.getCombatSettingByTournamentId(tournamentId);
    
    String newPhase = TournamentLifecycle.created;
    
    if (settings != null) {
      newPhase = TournamentLifecycle.settingsReady;
    }
    
    // TODO: Cuando los grupos estén listos, añadir verificación aquí
    // if (groupsExist) {
    //   newPhase = (settings != null) ? TournamentLifecycle.readyToStart : TournamentLifecycle.groupsReady;
    // }

    if (newPhase != phase) {
      await dao.update(
        TournamentCompanion(
          id: Value(tournamentId),
          setupPhase: Value(newPhase),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }
}
