import 'package:flutter/foundation.dart';
import '../../domain/usecases/users/login_user.dart';
import '../forms/validators.dart';
import 'session_controller.dart';

class LoginController extends ChangeNotifier {
  final LoginUser loginUser;
  final SessionController sessionController;

  String? userError;
  String? passwordError;

  LoginController(this.loginUser, this.sessionController);

  Future<bool> login(String user, String password) async {
    // VALIDACIONES
    userError = FormValidations.required(user, field: 'Usuario');
    passwordError = FormValidations.required(password, field: 'Contraseña');

    notifyListeners();

    if (userError != null || passwordError != null) {
      return false;
    }

    // LOGIN TEMPORAL
    if (user == 'usuario123' && password == '12345') {
      sessionController.saveUserName(user);
      return true;
    } else {
      return false;
    }
  }
}
