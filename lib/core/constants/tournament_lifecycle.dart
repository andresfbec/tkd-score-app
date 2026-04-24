/// Fases operativas del torneo (campo [TournamentEntity.setupPhase]).
/// El usuario no las edita a mano: avanzan con acciones (configurar, grupos, iniciar, etc.).
abstract class TournamentLifecycle {
  static const String created = 'created';
  static const String settingsReady = 'settings_ready';
  static const String groupsReady = 'groups_ready';
  static const String readyToStart = 'ready_to_start';
  static const String live = 'live';
  static const String finished = 'finished';

  /// Compatibilidad con filas antiguas (`draft` = recién creado).
  static String normalize(String phase) {
    if (phase == 'draft') return created;
    return phase;
  }

  static String labelEs(String phase) {
    switch (normalize(phase)) {
      case created:
        return 'Creado';
      case settingsReady:
        return 'Reglas definidas';
      case groupsReady:
        return 'Grupos definidos';
      case readyToStart:
        return 'Listo para iniciar';
      case live:
        return 'En curso';
      case finished:
        return 'Finalizado';
      default:
        return phase;
    }
  }

  static bool isLockedForEditing(String phase) {
    final p = normalize(phase);
    return p == live || p == finished;
  }

  static bool showConfigureButton(String phase) {
    final p = normalize(phase);
    return p == created || p == settingsReady || p == groupsReady;
  }

  /// Puede iniciarse si la fase lo indica o si hay señal explícita de reglas + grupos (cuando conectes DAOs).
  static bool canShowStartButton({
    required String phase,
    required bool hasCombatSettings,
    required bool hasGroupsDefined,
  }) {
    final p = normalize(phase);
    if (p == live || p == finished) return false;
    if (p == readyToStart) return true;
    return hasCombatSettings && hasGroupsDefined;
  }
}
