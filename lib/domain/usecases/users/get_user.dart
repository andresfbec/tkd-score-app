import '../../repositories/user_repository.dart';
import '../../entities/user_entity.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<List<UserEntity>> call() {
    return repository.getAll();
  }
}
