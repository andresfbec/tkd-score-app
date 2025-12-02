class LoginController {
  Future<bool> login(String user, String password) async {

    //simulation
    if (user == 'usuario123' && password == '12345') {
      return true;
    } else {
      return false;
    }
  }
}
