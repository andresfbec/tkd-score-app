import '../../repositories/user_repository.dart';
import '../../../core/utils/hash_text.dart';
import '../../repositories/headquarters_repository.dart';

class CreateUser {
  final UserRepository repository;
  final HeadquartersRepository headquartersRepository;

  CreateUser(this.repository, this.headquartersRepository);

  Future<int> call(String user, String password, int headquartersId) async {
    String test = user.toLowerCase().trim();
    if (user.trim().isEmpty) {
      throw Exception('El nombre de usuario es obligatorio');
    }
    if (password.trim().isEmpty) {
      throw Exception('La contraseña es obligatoria');
    }
    final headquarters = await headquartersRepository.getById(headquartersId);
    if (headquarters == null) {
      throw Exception('La sede no existe');
    }
    final exists = await repository.find(username: user);

    if (exists != null) {
      throw Exception('El usuario ya existe');
    }
    final hashedPassword = await hashPassword(password);

    return repository.create(test, hashedPassword, headquartersId);
  }
}
