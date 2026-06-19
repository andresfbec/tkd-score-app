import '../../entities/combat_settings_entity.dart';
import '../../repositories/combat_settings_repository.dart';

class GetCombatSettingById {
  final CombatSettingsRepository repository;

  GetCombatSettingById(this.repository);

  Future<CombatSettingsEntity?> call(int id) async {
    return await repository.getById(id);
  }
}
