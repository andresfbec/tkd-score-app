import '../entities/combat_settings_entity.dart';

abstract class CombatSettingsRepository {
  Future<int> create(CombatSettingsEntity settings);
  Future<bool> update(CombatSettingsEntity settings);
  Future<int> delete(int id);
  Stream<List<CombatSettingsEntity>> watchCombatSettings({
    int? tournamentId,
    String? formatType,
    String? eliminationType,
    bool? onlyActive,
  });
  Future<CombatSettingsEntity?> getByTournamentId(int tournamentId);
  Future<CombatSettingsEntity?> getById(int id);
}
