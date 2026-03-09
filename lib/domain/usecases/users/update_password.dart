import '../../entities/user_entity.dart';
import '../../../core/utils/hash_text.dart';

import '../../repositories/user_repository.dart';

class NewPassword {
  final UserRepository repository;
  NewPassword(this.repository);

  Future<bool> call(int pk, String newPassword, String confPassworsd) async {
    final existing = await repository.getById(pk);
    if (existing == null) {
      throw Exception('Usuario no Existe');
    }
    if (newPassword != confPassworsd) {
      throw Exception('Las contraseñas no coinciden');
    }
    final hashedPassword = await hashPassword(newPassword);

    final newUser = UserEntity(
      id: existing.id,
      username: existing.username,
      password: hashedPassword,
      headquarterId: existing.headquarterId,
    );

    return repository.update(newUser);
  }
}
