import '../../repositories/tournament_repository.dart';
import '../../entities/tournament_entity.dart';

class WatchTournaments {
  final TournamentRepository repository;

  WatchTournaments(this.repository);

  Stream<List<TournamentEntity>> call() {
    return repository.watchAll();
  }
}
