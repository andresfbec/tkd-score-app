import '../../repositories/headquarters_repository.dart';
import '../../entities/headquarters_entity.dart';

class WatchHeadquarters {
  final HeadquartersRepository repository;

  WatchHeadquarters(this.repository);

  Stream<List<HeadquartersEntity>> call() {
    return repository.watchAll();
  }
}
