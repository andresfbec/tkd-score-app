import '../../repositories/tournament_repository.dart';
import '../../errors/exceptions.dart';

class DeleteTournament {
  final TournamentRepository repository;

  DeleteTournament(this.repository);

  Future<int> call(int pk) async {
    final validate = await repository.getById(pk);
    if (validate == null) {
      throw TournamentNotFoundException();
    }
    return repository.delete(pk);
  }
}
