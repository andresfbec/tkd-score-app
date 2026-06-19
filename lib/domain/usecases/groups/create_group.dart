import '../../entities/groups_entity.dart';
import '../../repositories/groups_repository.dart';

class CreateGroup {
  final GroupsRepository repository;

  CreateGroup(this.repository);

  Future<int> call(GroupsEntity group) async {
    return await repository.createGroup(group);
  }
}
