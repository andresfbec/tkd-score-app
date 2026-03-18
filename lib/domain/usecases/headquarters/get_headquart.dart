import '../../entities/headquarters_entity.dart';
import '../../repositories/headquarters_repository.dart';

class GetHeadquart {
  final HeadquartersRepository repository;

  GetHeadquart(this.repository);

  Future<List<HeadquartersEntity>> call() {
    return repository.getAll();
  }
}
