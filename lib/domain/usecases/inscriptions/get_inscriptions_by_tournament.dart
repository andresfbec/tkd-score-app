import '../../entities/inscriptions_entity.dart';
import '../../repositories/inscriptions_repository.dart';

class GetInscriptionsByTournament {
  final InscriptionsRepository repository;

  GetInscriptionsByTournament(this.repository);

  Future<List<InscriptionsEntity>> call(int tournamentId) async {
    return await repository.getByTournament(tournamentId);
  }
}
