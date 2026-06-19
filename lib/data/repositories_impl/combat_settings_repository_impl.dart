import '../mappers/combat_settings_mapper.dart';
import '../../domain/entities/combat_settings_entity.dart';
import '../../domain/repositories/combat_settings_repository.dart';
import '../datasources/combat_settings_dao.dart';
import 'package:drift/drift.dart';

class CombatSettingsRepositoryImpl implements CombatSettingsRepository {
  final CombatSettingsDao combatSettingsDao;

  CombatSettingsRepositoryImpl({required this.combatSettingsDao});

  @override
  Future<int> create(CombatSettingsEntity settings) {
    final comp = CombatSettingsMapper.toCompanion(settings);

    return combatSettingsDao.insert(
      comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<bool> update(CombatSettingsEntity settings) {
    final comp = CombatSettingsMapper.toCompanion(settings);

    return combatSettingsDao.update(comp.copyWith(
      updatedAt: Value(DateTime.now())
      )
    );
  }

  @override
  Future<int> delete(int id) {
    return combatSettingsDao.delete(id);
  }

  @override
  Stream<List<CombatSettingsEntity>> watchCombatSettings({
    int? tournamentId,
    String? formatType,
    String? eliminationType,
    bool? onlyActive,
  }) {
    return combatSettingsDao.watchCombatSettings(
      tournamentId: tournamentId,
      formatType: formatType,
      eliminationType: eliminationType,
      onlyActive: onlyActive,
    ).map(
      (list) => list.map(CombatSettingsMapper.fromData).toList()
    );
  }

  @override
  Future<CombatSettingsEntity?> getByTournamentId(int tournamentId) async {
    final data = await combatSettingsDao.getCombatSettingByTournamentId(tournamentId);
    if (data == null) return null;
    return CombatSettingsMapper.fromData(data);
  }

  @override
  Future<CombatSettingsEntity?> getById(int id) async {
    final data = await combatSettingsDao.getCombatSettingById(id);
    if (data == null) return null;
    return CombatSettingsMapper.fromData(data);
  }
}
