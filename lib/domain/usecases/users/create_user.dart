import 'package:tkd_score/domain/entities/users_entity.dart';

import '../../repositories/users_repository.dart';
import '../../../core/utils/hash_text.dart';
import '../../repositories/headquarters_repository.dart';

class CreateUser {
  final UserRepository repository;
  final HeadquartersRepository headquartersRepository;

  CreateUser(this.repository, this.headquartersRepository);

  Future<int> call(UserEntity data) async {
    final username = data.username.toLowerCase().trim();

    if (username.isEmpty) {
      throw Exception('El nombre de usuario es obligatorio');
    }

    if (data.password == null || data.password!.trim().isEmpty) {
      throw Exception('La contraseña es obligatoria');
    }

    final headquarters = await headquartersRepository.getById(
      data.headquarterId,
    );
    print(headquarters);

    if (headquarters == null) {
      print(headquarters);
      throw Exception('La sede no existe');
    }

    final exists = await repository.getUsernameById(username);

    if (exists != null) {
      throw Exception('El usuario ya existe');
    }

    final hashedPassword = await hashPassword(data.password!.trim());

    final newUser = UserEntity(
      id: data.id,
      username: username,
      password: hashedPassword,
      headquarterId: data.headquarterId,
    );
    return repository.create(newUser);
  }
}
