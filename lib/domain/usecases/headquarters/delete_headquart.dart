import '../../repositories/headquarters_repository.dart';

class DeleteHeadquart {
  final HeadquartersRepository repository;

  DeleteHeadquart(this.repository);

  Future<int> call(int pk) async {
    final validate = await repository.getById(pk);
    if (validate == null) {
      throw Exception('El elemento a eliminar no exite');
    }
    return repository.delete(pk);
  }
}
