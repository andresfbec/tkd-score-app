/// Fases operativas del torneo (campo [TournamentEntity.setupPhase]).
/// El usuario no las edita a mano: avanzan con acciones (configurar, grupos, iniciar, etc.).
abstract class TournamentLifecycle {
  static const String created = 'created';
  static const String settingsReady = 'settings_ready';
  static const String groupsReady = 'groups_ready';
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
        return 'Config.';
      case groupsReady:
        return 'Grupos';
      case live:
        return 'En curso';
      case finished:
        return 'Fin';
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

  /// Puede iniciarse si está en la fase de grupos definidos.
  static bool canShowStartButton({
    required String phase,
    required bool hasCombatSettings,
    required bool hasGroupsDefined,
  }) {
    final p = normalize(phase);
    if (p == live || p == finished) return false;
    return p == groupsReady;
  }

  /// Evalúa si el torneo cumple con las condiciones para pasar al estado 'Grupos definidos'
  /// (y por lo tanto, estar listo para iniciar):
  /// 1. Tiene al menos una inscripción.
  /// 2. Tiene al menos un grupo creado.
  /// 3. TODAS las inscripciones activas tienen un grupo asignado.
  static bool canAdvanceToGroupsReady({
    required int totalInscriptions,
    required int totalGroups,
    required int unassignedInscriptionsCount,
  }) {
    return totalInscriptions > 0 && 
           totalGroups > 0 && 
           unassignedInscriptionsCount == 0;
  }
}
