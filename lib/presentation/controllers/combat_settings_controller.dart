import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/entities/combat_settings_entity.dart';
import '../../domain/usecases/combat_settings/create_combat_setting.dart';
import '../../domain/usecases/combat_settings/update_combat_setting.dart';
import '../../domain/usecases/combat_settings/delete_combat_setting.dart';
import '../../domain/usecases/combat_settings/watch_combat_settings.dart';
import '../../domain/usecases/combat_settings/get_combat_setting_by_tournament_id.dart';
import '../../domain/usecases/combat_settings/get_combat_setting_by_id.dart';
import '../../domain/usecases/tournament/sync_tournament_setup_phase.dart';

import '../../core/enums/status.dart';

class CombatSettingsController extends ChangeNotifier {
  final CreateCombatSetting createUseCase;
  final UpdateCombatSetting updateUseCase;
  final DeleteCombatSetting deleteUseCase;
  final WatchCombatSettings watchUseCase;
  final GetCombatSettingByTournamentId getByTournamentIdUseCase;
  final GetCombatSettingById getByIdUseCase;
  final SyncTournamentSetupPhase syncUseCase;

  CombatSettingsController({
    required this.createUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
    required this.watchUseCase,
    required this.getByTournamentIdUseCase,
    required this.getByIdUseCase,
    required this.syncUseCase,
  });

  // ===============================
  // ESTADO (STATE)
  // ===============================
  List<CombatSettingsEntity> _allSettings = [];
  Status status = Status.idle;
  String? message;
  String _searchQuery = "";

  StreamSubscription<List<CombatSettingsEntity>>? _subscription;

  List<CombatSettingsEntity> get settings => _allSettings;

  // ===============================
  // GETTERS
  // ===============================
  
  // Filtro de búsqueda local (por formatType o eliminationType, por ejemplo)
  List<CombatSettingsEntity> get filteredSettings {
    if (_searchQuery.isEmpty) return _allSettings;

    final query = _searchQuery.toLowerCase();
    return _allSettings.where((s) {
      return s.formatType.toLowerCase().contains(query) ||
             s.eliminationType.toLowerCase().contains(query);
    }).toList();
  }

  // ===============================
  // MÉTODOS DE FLUJO (STREAM)
  // ===============================

  void startListening({
    int? tournamentId,
    String? formatType,
    String? eliminationType,
    bool onlyActive = true,
  }) {
    status = Status.loading;
    notifyListeners();

    _subscription?.cancel(); // Cancelamos la suscripción anterior para no tener fugas de memoria
    
    _subscription = watchUseCase(
      tournamentId: tournamentId,
      formatType: formatType,
      eliminationType: eliminationType,
      onlyActive: onlyActive,
    ).listen(
      (data) {
        _allSettings = data;
        status = Status.success;
        notifyListeners();
      },
      onError: (error) {
        status = Status.error;
        message = 'Error en la conexión de datos: $error';
        notifyListeners();
      },
    );
  }

  // ===============================
  // OPERACIONES CRUD
  // ===============================

  // CREATE
  Future<void> addSetting(CombatSettingsEntity setting) async {
    try {
      status = Status.loading;
      notifyListeners();

      await createUseCase(setting);
      await syncUseCase(setting.tournamentId);

      status = Status.success;
      message = "Configuración de combate registrada correctamente";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  // UPDATE
  Future<void> editSetting(CombatSettingsEntity setting) async {
    try {
      status = Status.loading;
      notifyListeners();

      await updateUseCase(setting);
      await syncUseCase(setting.tournamentId);

      status = Status.success;
      message = "Configuración actualizada correctamente";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  // DELETE
  Future<void> removeSetting(int id) async {
    try {
      status = Status.loading;
      notifyListeners();

      // Para remover, necesitamos saber de qué torneo era para sincronizar
      final existing = await getByIdUseCase(id);
      
      await deleteUseCase(id);
      
      if (existing != null) {
        await syncUseCase(existing.tournamentId);
      }

      status = Status.success;
      message = "Configuración eliminada o inactivada con éxito";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  // ===============================
  // MÉTODOS ADICIONALES
  // ===============================

  // Este método es útil para cuando necesitas cargar la configuración de 1 solo torneo
  // de forma síncrona sin afectar el flujo del Stream principal.
  Future<CombatSettingsEntity?> getByTournamentId(int tournamentId) async {
    try {
      return await getByTournamentIdUseCase(tournamentId);
    } catch (e) {
      message = e.toString().replaceAll('Exception:', '').trim();
      notifyListeners();
      return null;
    }
  }

  // ===============================
  // MÉTODOS SECUNDARIOS
  // ===============================

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void clearError() {
    status = Status.idle;
    message = null;
    notifyListeners();
  }

  void clearMessages() {
    status = Status.idle;
    message = null;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
