class FormValidations {

  // ==========================
  // VALIDACIONES BASE
  // ==========================

  static String? required(String? value, {String field = 'Este campo'}) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo $field es obligatorio';
    }
    return null;
  }

  static String? minLength(String? value, int min, {String field = 'Este campo'}) {
    if (value != null && value.trim().length < min) {
      return '$field debe tener al menos $min caracteres';
    }
    return null;
  }

  static String? maxLength(String? value, int max, {String field = 'Este campo'}) {
    if (value != null && value.length > max) {
      return '$field no puede tener más de $max caracteres';
    }
    return null;
  }

  static String? emailFormat(String? value) {
    if (value == null || value.isEmpty) return null;

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (!emailRegex.hasMatch(value)) {
      return 'Correo inválido';
    }

    return null;
  }

  static String? minNumber(String? value, int min, {String field = 'Este campo'}) {
    if (value == null || value.isEmpty) return null;

    final number = int.tryParse(value);
    if (number != null && number < min) {
      return '$field debe ser mayor o igual a $min';
    }

    return null;
  }

  static String? maxNumber(String? value, int max, {String field = 'Este campo'}) {
    if (value == null || value.isEmpty) return null;

    final number = int.tryParse(value);
    if (number != null && number > max) {
      return '$field debe ser menor o igual a $max';
    }

    return null;
  }


  // ==========================
  // VALIDACIONES COMPUESTAS PARA CAMPOS ESPECÍFICOS  
  // ==========================

  static String? isoDate(String? value, {String field = 'Fecha'}) {
    final req = required(value, field: field);
    if (req != null) return req;
    final d = DateTime.tryParse(value!.trim());
    if (d == null) {
      return '$field inválida. Use AAAA-MM-DD';
    }
    return null;
  }

  static String? validateName(String? value) {

    final requiredError = required(value, field: "Nombre");
    if (requiredError != null) return requiredError;

    final minError = minLength(value, 3, field: "Nombre");
    if (minError != null) return minError;

    final maxError = maxLength(value, 40, field: "Nombre");
    if (maxError != null) return maxError;

    return null;
  }

  static String? validateEmail(String? value) {

    final requiredError = required(value, field: "Correo");
    if (requiredError != null) return requiredError;

    final emailError = emailFormat(value);
    if (emailError != null) return emailError;

    return null;
  }

  static String? validatePassword(String? value) {

    final requiredError = required(value, field: "Contraseña");
    if (requiredError != null) return requiredError;

    final minError = minLength(value, 8, field: "Contraseña");
    if (minError != null) return minError;

    return null;
  }

  static String? validatePhone(String? value) {

    final requiredError = required(value, field: "Teléfono");
    if (requiredError != null) return requiredError;

    final minError = minLength(value, 7, field: "Teléfono");
    if (minError != null) return minError;

    final maxError = maxLength(value, 15, field: "Teléfono");
    if (maxError != null) return maxError;

    return null;
  }

  static String? validateNotNull<T>(T? value, {String field = 'Este campo'}) {
    if (value == null) {
      return '$field es obligatorio';
    }
    return null;
  }

}