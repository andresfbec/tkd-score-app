import '../../repositories/headquarters_repository.dart';
import '../../errors/exceptions.dart';

class DeleteHeadquarter {
  final HeadquartersRepository repository;

  DeleteHeadquarter(this.repository);

  // validar si la sede tiene estudiantes asociados, para evitar eliminarla mientras hay estudiantes vinculados

  Future<int> call(int pk) async {
    final validate = await repository.getById(pk);
    if (validate == null) {
      throw HeadquarterNotFoundException();
    }
    return repository.delete(pk);
  }
}
