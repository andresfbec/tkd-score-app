import '../../repositories/versus_repository.dart';

class DeleteAllVersusByGroup {
  final VersusRepository repository;

  DeleteAllVersusByGroup(this.repository);

  Future<void> call(int groupId) async {
    return await repository.deleteAllByGroup(groupId);
  }
}
