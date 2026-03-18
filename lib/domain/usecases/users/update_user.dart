import '../../entities/user_entity.dart';
import '../../repositories/user_repository.dart';
import '../../repositories/headquarters_repository.dart';

class UpdateUser {
  final UserRepository repository;
  final HeadquartersRepository headquartersRepository;

  UpdateUser(this.repository, this.headquartersRepository);

  Future<bool> call(int pk, String? username, int? headquarterId) async {
    final existing = await repository.getById(pk);

    if (existing == null) {
      throw Exception('Usuario no existe');
    }

    if (headquarterId != null) {
      final headquarters = await headquartersRepository.getById(headquarterId);
      if (headquarters == null) {
        throw Exception('La sede no existe');
      }
    }

    final updatedUser = UserEntity(
      id: existing.id,
      username: username ?? existing.username,
      headquarterId: headquarterId ?? existing.headquarterId,
      password: null, // se ignora en el update
    );

    return repository.update(updatedUser);
  }
}
