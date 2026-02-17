import '../../entities/user_entity.dart';
import '../../repositories/user_repository.dart';

class NewPassword {
  final UserRepository repository;
  NewPassword(this.repository);

  Future<int> call(int pk, String newPassword, String confPassworsd) async {
    final existing = await repository.getById(pk);
    if (existing == null) {
      throw Exception('Usuario no Existe');
    }
    if (newPassword != confPassworsd) {
      throw Exception('Las contraseñas no coinciden');
    }
    final newUser = UserEntity(
      id: existing.id,
      username: existing.username,
      headquarters: existing.headquarters,
    );

    return repository.updatePassword(newUser, newPassword);
  }
}
