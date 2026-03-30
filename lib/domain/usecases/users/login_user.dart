import '../../repositories/users_repository.dart';
import '../../../core/utils/hash_text.dart';

class LoginUser {
  final UserRepository repository;

  LoginUser(this.repository);

  Future<Map<String, dynamic>?> call(String username, String password) async {
    final dataUser = await repository.getUsernameById(username);

    if (dataUser == null) {
      return null;
    }
    final hashedPassword = await verifyPassword(password, dataUser.password!);
    if (hashedPassword) {
      return {'username': username, 'headquart': dataUser.headquarterId};
    }

    return null;
  }
}
