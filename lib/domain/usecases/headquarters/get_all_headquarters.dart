import '../../entities/headquarters_entity.dart';
import '../../repositories/headquarters_repository.dart';

class GetAllHeadquarters {
  final HeadquartersRepository repository;

  GetAllHeadquarters(this.repository);

  Future<List<HeadquartersEntity>> call() {
    return repository.getAll();
  }
}
