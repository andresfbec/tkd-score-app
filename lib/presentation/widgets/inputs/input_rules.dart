// Este archivo define las reglas, osea lo que el usuario puede o no escribir en los campos ej. juan123 (no se puede)

import 'package:flutter/services.dart';
import '../../../core/enums/input_type.dart';


class InputRules {

  static List<TextInputFormatter> getFormatters(InputType type) {

    switch (type) {

      case InputType.name:
        return [
          FilteringTextInputFormatter.allow( // Solo letras, espacios y acentos LO DEMAS NO
            RegExp(r"[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]")
          ),
        ];

      case InputType.number:
        return [
          FilteringTextInputFormatter.digitsOnly // Solo números
        ];

      case InputType.phone:
        return [
          FilteringTextInputFormatter.allow( // Solo números, espacios, guiones y signos de más
            RegExp(r"[0-9+]")
          ),
        ];

      case InputType.alphanumeric:
        return [
          FilteringTextInputFormatter.allow( // Solo letras y números DEMAS CARACTERES NO
            RegExp(r"[a-zA-Z0-9]")
          ),
        ];

      case InputType.text:
        return [];

      case InputType.email:
        return [];

      case InputType.password:
        return [];
    }
  }
}