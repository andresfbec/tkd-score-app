import '../../entities/versus_entity.dart';
import '../../repositories/versus_repository.dart';

class WatchVersusByGroupId {
  final VersusRepository repository;

  WatchVersusByGroupId(this.repository);

  Stream<List<VersusEntity>> call(int groupId) {
    return repository.watchByGroupId(groupId);
  }
}
