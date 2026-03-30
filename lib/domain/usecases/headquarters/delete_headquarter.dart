import '../../repositories/headquarters_repository.dart';
import '../../errors/exceptions.dart';

class DeleteHeadquarter {
  final HeadquartersRepository repository;

  DeleteHeadquarter(this.repository);

  Future<int> call(int pk) async {
    final validate = await repository.getById(pk);
    if (validate == null) {
      throw HeadquarterNotFoundException();
    }
    return repository.delete(pk);
  }
}
