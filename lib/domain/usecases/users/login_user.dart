import '../../repositories/user_repository.dart';
import '../../../core/utils/hash_text.dart';

class LoginUser {
  final UserRepository repository;

  LoginUser(this.repository);

  Future<bool> call(String username, String password) async {
    final user = await repository.getUsernameById(username);
    print(user);
    if (user == null) {
      return false;
    }
    final hashedPassword = verifyPassword(password, user);

    return hashedPassword;
  }
}
