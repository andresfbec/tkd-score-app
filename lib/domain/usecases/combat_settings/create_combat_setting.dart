import '../../entities/combat_settings_entity.dart';
import '../../repositories/combat_settings_repository.dart';

class CreateCombatSetting {
  final CombatSettingsRepository repository;

  CreateCombatSetting(this.repository);

  Future<int> call(CombatSettingsEntity settings) async {
    // Puedes agregar validaciones de dominio aquí, 
    // por ejemplo: si formatType está vacío lanzar excepción.
    return await repository.create(settings);
  }
}
