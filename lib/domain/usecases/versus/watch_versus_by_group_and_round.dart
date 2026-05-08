import '../../entities/versus_entity.dart';
import '../../repositories/versus_repository.dart';

class WatchVersusByGroupAndRound {
  final VersusRepository repository;

  WatchVersusByGroupAndRound(this.repository);

  Stream<List<VersusEntity>> call(int groupId, int bracketRound) {
    return repository.watchByGroupAndRound(groupId, bracketRound);
  }
}
