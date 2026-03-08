// presentation/controllers/session_controller.dart
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionController extends ChangeNotifier {
  String? _userName;
  bool _isLogged = false;

  String? get userName => _userName;
  bool get isLogged => _isLogged;

  // Constructor que carga la sesión automáticamente
  SessionController() {
    _loadSession();
  }

  // Guardar nombre de usuario
  Future<void> saveUserName(String name) async {
    _userName = name;
    _isLogged = true;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
    await prefs.setBool('is_logged', true);

    notifyListeners();
  }

  // Cargar sesión al iniciar
  Future<void> _loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    _userName = prefs.getString('user_name');
    _isLogged = prefs.getBool('is_logged') ?? false;

    notifyListeners();
  }

  // Limpiar sesión
  Future<void> clearSession() async {
    _userName = null;
    _isLogged = false;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_name');
    await prefs.setBool('is_logged', false);

    notifyListeners();
  }
}
