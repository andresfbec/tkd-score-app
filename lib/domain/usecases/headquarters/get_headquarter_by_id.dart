import '../../errors/exceptions.dart';
import '../../repositories/headquarters_repository.dart';
import '../../entities/headquarters_entity.dart';

class GetHeadquarterById {
  final HeadquartersRepository repository;

  GetHeadquarterById(this.repository);

  Future<HeadquartersEntity> call(int id) async {
    final result = await repository.getById(id);

    if (result == null) {
      throw HeadquarterNotFoundException();
    }

    return result;
  }
}
