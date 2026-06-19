import '../../repositories/groups_repository.dart';

class DeleteGroup {
  final GroupsRepository repository;

  DeleteGroup(this.repository);

  Future<void> call(int groupId) async {
    return await repository.deleteGroup(groupId);
  }
}
