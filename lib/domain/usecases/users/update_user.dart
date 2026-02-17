import '../../entities/user_entity.dart';
import '../../repositories/user_repository.dart';
import '../../repositories/headquarters_repository.dart';

class UpdateUser {
  final UserRepository repository;
  final HeadquartersRepository headquartersRepository;

  UpdateUser(this.repository, this.headquartersRepository);

  Future<int> call(int pk, String? username, int? headquartId) async {
    final existing = await repository.getById(pk);
    if (existing == null) {
      throw Exception('Usuario no Existe');
    }
    if (headquartId != null) {
      final headquarters = await headquartersRepository.getById(headquartId);
      if (headquarters == null) {
        throw Exception('La sede no existe');
      }
    }
    final newUser = UserEntity(
      id: existing.id,
      username: username ?? existing.username,
      headquarters: headquartId ?? existing.headquarters,
    );
    return await repository.update(newUser);
  }
}
