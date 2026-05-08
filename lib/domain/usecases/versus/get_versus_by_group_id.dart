import '../../entities/versus_entity.dart';
import '../../repositories/versus_repository.dart';

class GetVersusByGroupId {
  final VersusRepository repository;

  GetVersusByGroupId(this.repository);

  Future<List<VersusEntity>> call(int groupId) async {
    return await repository.getByGroupId(groupId);
  }
}
