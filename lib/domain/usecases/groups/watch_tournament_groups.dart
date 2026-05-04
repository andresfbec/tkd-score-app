import '../../entities/groups_entity.dart';
import '../../repositories/groups_repository.dart';

class WatchTournamentGroups {
  final GroupsRepository repository;

  WatchTournamentGroups(this.repository);

  Stream<List<GroupsEntity>> call(int tournamentId) {
    return repository.watchGroupsByTournament(tournamentId);
  }
}
