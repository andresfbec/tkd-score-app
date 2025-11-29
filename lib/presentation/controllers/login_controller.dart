class LoginController {
  Future<bool> login(String email, String password) async {

    //simulation
    if (email == 'pepito07@gmail.com' && password == '12345') {
      return true;
    } else {
      return false;
    }
  }
}
