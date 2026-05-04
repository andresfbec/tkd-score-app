import '../entities/groups_entity.dart';

abstract class GroupsRepository {
  /// Genera grupos estándar usando las constantes de WT y los inserta en BD.
  Future<void> generateStandardGroups({
    required int tournamentId,
    required List<String> selectedAges,
    required List<String> selectedBelts,
    int? weightStepKg,
    bool? mergeGenders,
    bool? mergeAges,
  });

  /// Observa la lista de grupos de un torneo, incluyendo la cantidad de participantes si aplica.
  Stream<List<GroupsEntity>> watchGroupsByTournament(int tournamentId);

  /// Elimina todos los grupos generados automáticamente (para poder volver a generarlos).
  Future<void> deleteGeneratedGroups(int tournamentId);

  /// Toma todos los estudiantes inscritos en el torneo y les asigna su groupId
  /// según edad, género, peso y cinturón.
  Future<void> autoAssignInscriptions(int tournamentId);

  /// Actualiza manualmente el grupo de una inscripción específica.
  Future<void> updateInscriptionGroup(int inscriptionId, int? groupId);

  /// Fusiona un grupo que tiene pocos participantes con su grupo vecino.
  Future<void> mergeGroupWithNeighbour(int groupId);

  // New manual methods
  Future<int> createGroup(GroupsEntity group);
  Future<void> deleteGroup(int groupId);
}
