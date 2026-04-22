import '../../repositories/combat_settings_repository.dart';

class DeleteCombatSetting {
  final CombatSettingsRepository repository;

  DeleteCombatSetting(this.repository);

  Future<int> call(int id) async {
    return await repository.delete(id);
  }
}
