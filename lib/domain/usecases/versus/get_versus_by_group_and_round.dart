import '../../entities/versus_entity.dart';
import '../../repositories/versus_repository.dart';

class GetVersusByGroupAndRound {
  final VersusRepository repository;

  GetVersusByGroupAndRound(this.repository);

  Future<List<VersusEntity>> call(int groupId, int bracketRound) async {
    return await repository.getByGroupAndRound(groupId, bracketRound);
  }
}
