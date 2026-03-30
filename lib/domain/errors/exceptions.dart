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