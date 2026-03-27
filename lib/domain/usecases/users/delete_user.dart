import '../../repositories/users_repository.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Future<int> call(int pk) async {
    final validate = await repository.getById(pk);

    if (validate == null) {
      throw Exception("El elemento a eliminar no Exite");
    }

    return repository.delete(pk);
  }
}
