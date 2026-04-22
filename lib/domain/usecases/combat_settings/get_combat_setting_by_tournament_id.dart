import '../../entities/combat_settings_entity.dart';
import '../../repositories/combat_settings_repository.dart';

class GetCombatSettingByTournamentId {
  final CombatSettingsRepository repository;

  GetCombatSettingByTournamentId(this.repository);

  Future<CombatSettingsEntity?> call(int tournamentId) async {
    return await repository.getByTournamentId(tournamentId);
  }
}
