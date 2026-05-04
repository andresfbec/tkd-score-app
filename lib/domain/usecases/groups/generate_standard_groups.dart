import '../../repositories/groups_repository.dart';

class GenerateStandardGroups {
  final GroupsRepository repository;

  GenerateStandardGroups(this.repository);

  Future<void> call({
    required int tournamentId,
    required List<String> selectedAges,
    required List<String> selectedBelts,
    int? weightStepKg,
    bool? mergeGenders,
    bool? mergeAges,
  }) async {
    return await repository.generateStandardGroups(
      tournamentId: tournamentId,
      selectedAges: selectedAges,
      selectedBelts: selectedBelts,
      weightStepKg: weightStepKg,
      mergeGenders: mergeGenders,
      mergeAges: mergeAges,
    );
  }
}
