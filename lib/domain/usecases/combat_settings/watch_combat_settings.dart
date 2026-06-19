import '../../entities/combat_settings_entity.dart';
import '../../repositories/combat_settings_repository.dart';

class WatchCombatSettings {
  final CombatSettingsRepository repository;

  WatchCombatSettings(this.repository);

  Stream<List<CombatSettingsEntity>> call({
    int? tournamentId,
    String? formatType,
    String? eliminationType,
    bool? onlyActive,
  }) {
    return repository.watchCombatSettings(
      tournamentId: tournamentId,
      formatType: formatType,
      eliminationType: eliminationType,
      onlyActive: onlyActive,
    );
  }
}
