class TournamentFormOptions {
  static const List<Map<String, String>> tournamentStatuses = [
    {'value': 'draft', 'label': 'Borrador'},
    {'value': 'planned', 'label': 'Planificado'},
    {'value': 'active', 'label': 'Activo'},
    {'value': 'cancelled', 'label': 'Cancelado'},
  ];

  static const List<Map<String, String>> disciplines = [
    {'value': 'combat', 'label': 'Combate'},
    {'value': 'poomsae', 'label': 'Poomsae'},
  ];

  static const List<Map<String, String>> setupPhases = [
    {'value': 'draft', 'label': 'Borrador'},
    {'value': 'settings_ready', 'label': 'Configuración lista'},
    {'value': 'groups_ready', 'label': 'Grupos listos'},
    {'value': 'ready_to_start', 'label': 'Listo para iniciar'},
    {'value': 'live', 'label': 'En curso'},
    {'value': 'finished', 'label': 'Finalizado'},
  ];
}
