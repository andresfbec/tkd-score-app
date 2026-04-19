import '../../entities/tournament_entity.dart';
import '../../repositories/tournament_repository.dart';

class GetTournamentById {
  final TournamentRepository repository;

  GetTournamentById(this.repository);

  Future<TournamentEntity?> call(int id) {
    return repository.getById(id);
  }
}
