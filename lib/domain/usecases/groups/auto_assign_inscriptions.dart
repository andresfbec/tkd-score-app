import '../../repositories/groups_repository.dart';

class AutoAssignInscriptions {
  final GroupsRepository repository;

  final int minStudentsPerGroup;

  AutoAssignInscriptions(this.repository, {this.minStudentsPerGroup = 4});

  Future<void> call(int tournamentId) async {
    // Lógica actual que asigna inscripciones a los grupos existentes
    await repository.autoAssignInscriptions(tournamentId);

    // Nuevo paso: validar número mínimo de participantes
    // Tenemos que observar o hacer un fetch de los grupos. 
    // Usaremos un truco: suscribirnos, coger el primer valor y cancelar, o modificar el repositorio para tener fetchGroupsByTournament.
    // Como tenemos watchGroupsByTournament, lo más sencillo es escucharlo una vez.
    final groupsStream = repository.watchGroupsByTournament(tournamentId);
    final groups = await groupsStream.first;

    for (final group in groups) {
      if ((group.participantsCount ?? 0) < minStudentsPerGroup) {
        // Intentamos fusionar con el rango adyacente (peso contiguo)
        await repository.mergeGroupWithNeighbour(group.id!);
      }
    }
  }
}
