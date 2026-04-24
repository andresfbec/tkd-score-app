import '../db/database.dart';
import '../db/app_database_provider.dart';

import '../../../data/datasources/combat_settings_dao.dart';
import '../../../data/repositories_impl/combat_settings_repository_impl.dart';

import '../../../domain/usecases/combat_settings/create_combat_setting.dart';
import '../../../domain/usecases/combat_settings/update_combat_setting.dart';
import '../../../domain/usecases/combat_settings/delete_combat_setting.dart';
import '../../../domain/usecases/combat_settings/watch_combat_settings.dart';
import '../../../domain/usecases/combat_settings/get_combat_setting_by_tournament_id.dart';
import '../../../domain/usecases/combat_settings/get_combat_setting_by_id.dart';

class InjectionCombatSettings {
  static final InjectionCombatSettings _instance = InjectionCombatSettings._internal();
  factory InjectionCombatSettings() => _instance;
  InjectionCombatSettings._internal();

  CombatSettingsRepositoryImpl? _repository;

  CombatSettingsRepositoryImpl get _getRepo {
    return _repository ??= CombatSettingsRepositoryImpl(
      combatSettingsDao: CombatSettingsDao(AppDatabaseProvider.instance),
    );
  }

  CreateCombatSetting get createCombatSetting => CreateCombatSetting(_getRepo);
  UpdateCombatSetting get updateCombatSetting => UpdateCombatSetting(_getRepo);
  DeleteCombatSetting get deleteCombatSetting => DeleteCombatSetting(_getRepo);
  WatchCombatSettings get watchCombatSettings => WatchCombatSettings(_getRepo);
  GetCombatSettingByTournamentId get getCombatSettingByTournamentId => GetCombatSettingByTournamentId(_getRepo);
  GetCombatSettingById get getCombatSettingById => GetCombatSettingById(_getRepo);
}
