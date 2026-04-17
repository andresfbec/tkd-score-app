import '../../entities/tournament_entity.dart';
import '../../repositories/tournament_repository.dart';
import '../../errors/exceptions.dart';

class CreateTournament {
  final TournamentRepository repository;

  CreateTournament(this.repository);

  Future<int> call(TournamentEntity tournament) async {
    if (tournament.name.trim().isEmpty) {
      throw EmptyTournamentNameException();
    }
    if (tournament.location.trim().isEmpty) {
      throw EmptyAddressException();
    }
    if (tournament.dateEnd.isBefore(tournament.dateStart)) {
      throw InvalidTournamentDatesException();
    }

    final exists = await repository.find(
      name: tournament.name,
      location: tournament.location,
      dateStart: tournament.dateStart,
    );

    if (exists.isNotEmpty) {
      throw TournamentAlreadyExistsException();
    }

    return repository.create(tournament);
  }
}
