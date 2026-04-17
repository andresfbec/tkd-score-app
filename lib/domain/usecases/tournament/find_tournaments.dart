import '../../entities/tournament_entity.dart';
import '../../repositories/tournament_repository.dart';

class FindTournaments {
  final TournamentRepository repository;

  FindTournaments(this.repository);

  Future<List<TournamentEntity>> call({
    String? name,
    String? location,
    String? status,
    DateTime? dateStart,
  }) {
    return repository.find(
      name: name,
      location: location,
      status: status,
      dateStart: dateStart,
    );
  }
}
