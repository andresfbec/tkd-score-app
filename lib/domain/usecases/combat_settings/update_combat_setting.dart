import '../../entities/combat_settings_entity.dart';
import '../../repositories/combat_settings_repository.dart';

class UpdateCombatSetting {
  final CombatSettingsRepository repository;

  UpdateCombatSetting(this.repository);

  Future<bool> call(CombatSettingsEntity settings) async {
    if (settings.id == null) {
      throw ArgumentError('El ID no puede ser nulo para actualizar');
    }
    return await repository.update(settings);
  }
}
