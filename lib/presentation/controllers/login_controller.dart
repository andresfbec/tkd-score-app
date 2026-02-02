import 'package:flutter/foundation.dart';

import '../../domain/usecases/users/login_user.dart';

class LoginController extends ChangeNotifier {
  final LoginUser loginUser;

  LoginController(this.loginUser);

  Future<bool> login(String user, String password) async {
    final result = await loginUser.call(user, password);
    notifyListeners();
    return result;

    // if (user == 'usuario123' && password == '12345') {
    //   return true;
    // } else {
    //   return false;
    // }
  }
}
