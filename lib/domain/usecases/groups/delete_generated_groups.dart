import '../../repositories/groups_repository.dart';

class DeleteGeneratedGroups {
  final GroupsRepository repository;

  DeleteGeneratedGroups(this.repository);

  Future<void> call(int tournamentId) async {
    return await repository.deleteGeneratedGroups(tournamentId);
  }
}
