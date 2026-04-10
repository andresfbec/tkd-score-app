
class DateHelper {
  /// Calcula la edad exacta basándose en una fecha de nacimiento
  static int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    // Si el mes actual es menor al de nacimiento, 
    // o si es el mismo mes pero el día actual es menor, 
    // aún no ha cumplido años este año.
    if (today.month < birthDate.month || 
       (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  /// Opcional: Para mostrar la fecha en formato legible en la UI
  static String formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }
}