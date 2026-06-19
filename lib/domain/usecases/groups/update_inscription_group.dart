import '../../repositories/groups_repository.dart';

class UpdateInscriptionGroup {
  final GroupsRepository repository;

  UpdateInscriptionGroup(this.repository);

  Future<void> call(int inscriptionId, int? groupId) async {
    return await repository.updateInscriptionGroup(inscriptionId, groupId);
  }
}
