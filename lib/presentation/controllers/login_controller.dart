import 'package:flutter/foundation.dart';

import '../../domain/usecases/users/login_user.dart';
import 'session_controller.dart';

class LoginController extends ChangeNotifier {
  final LoginUser loginUser;
  final SessionController sessionController;

  LoginController(this.loginUser, this.sessionController);

  Future<bool> login(String user, String password) async {
    // final result = await loginUser.call(user, password);
    // notifyListeners();
    // return result;

    if (user == 'usuario123' && password == '12345') {
      sessionController.saveUserName(user);
      return true;
    } else {
      return false;
    }
  }
}
