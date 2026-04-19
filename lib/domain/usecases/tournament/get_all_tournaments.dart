import '../../entities/tournament_entity.dart';
import '../../repositories/tournament_repository.dart';

class GetAllTournaments {
  final TournamentRepository repository;

  GetAllTournaments(this.repository);

  Future<List<TournamentEntity>> call() {
    return repository.getAll();
  }
}
