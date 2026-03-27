import '../../repositories/users_repository.dart';
import '../../entities/users_entity.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<List<UserEntity>> call() {
    return repository.getAll();
  }
}
