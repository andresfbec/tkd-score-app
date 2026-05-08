import '../../entities/versus_entity.dart';
import '../../repositories/versus_repository.dart';

class GetVersusByTournamentId {
  final VersusRepository repository;

  GetVersusByTournamentId(this.repository);

  Future<List<VersusEntity>> call(int tournamentId) async {
    return await repository.getByTournamentId(tournamentId);
  }
}
