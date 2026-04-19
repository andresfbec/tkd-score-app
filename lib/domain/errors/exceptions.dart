class HeadquarterAlreadyExistsException implements Exception {
  @override
  String toString() => "La sede ya existe";
}

class HeadquarterNotFoundException implements Exception {
  @override
  String toString() => "Sede no encontrada";
}

class EmptyNameException implements Exception {
  @override
  String toString() => "El nombre es obligatorio";
}

class EmptyPhoneException implements Exception {
  @override
  String toString() => "El teléfono es obligatorio";
}

class EmptyCityException implements Exception {
  @override
  String toString() => "La ciudad es obligatoria";
}

class EmptyAddressException implements Exception {
  @override
  String toString() => "La dirección es obligatoria";
}

class EmptyMasterException implements Exception {
  @override
  String toString() => "El responsable de la sede es obligatorio";
}

class TournamentAlreadyExistsException implements Exception {
  @override
  String toString() => "Ya existe un torneo con el mismo nombre, lugar y fecha de inicio";
}

class TournamentNotFoundException implements Exception {
  @override
  String toString() => "Torneo no encontrado";
}

class EmptyTournamentNameException implements Exception {
  @override
  String toString() => "El nombre del torneo es obligatorio";
}

class InvalidTournamentDatesException implements Exception {
  @override
  String toString() => "La fecha de fin debe ser igual o posterior a la de inicio";
}

class TournamentLockedException implements Exception {
  @override
  String toString() =>
      "El torneo no puede modificarse en este estado";
}

class TournamentNotReadyToStartException implements Exception {
  @override
  String toString() =>
      "Defina las reglas de combate y los grupos antes de iniciar el torneo";
}