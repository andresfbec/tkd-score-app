import '../../entities/tournament_entity.dart';
import '../../repositories/tournament_repository.dart';
import '../../errors/exceptions.dart';

class UpdateTournament {
  final TournamentRepository repository;

  UpdateTournament(this.repository);

  Future<bool> call(
    int pk, {
    String? name,
    String? host,
    String? location,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? status,
    String? discipline,
    String? setupPhase,
  }) async {
    final existing = await repository.getById(pk);

    if (existing == null) {
      throw TournamentNotFoundException();
    }

    final updated = TournamentEntity(
      id: pk,
      name: name ?? existing.name,
      host: host ?? existing.host,
      location: location ?? existing.location,
      dateStart: dateStart ?? existing.dateStart,
      dateEnd: dateEnd ?? existing.dateEnd,
      status: status ?? existing.status,
      discipline: discipline ?? existing.discipline,
      setupPhase: setupPhase ?? existing.setupPhase,
    );

    if (updated.dateEnd.isBefore(updated.dateStart)) {
      throw InvalidTournamentDatesException();
    }

    final nameChanged = name != null && name != existing.name;
    final locationChanged = location != null && location != existing.location;
    final dateStartChanged =
        dateStart != null && dateStart != existing.dateStart;

    if (nameChanged || locationChanged || dateStartChanged) {
      final matches = await repository.find(
        name: updated.name,
        location: updated.location,
        dateStart: updated.dateStart,
      );

      final isDuplicate = matches.any((t) => t.id != pk);

      if (isDuplicate) {
        throw TournamentAlreadyExistsException();
      }
    }

    return repository.update(updated);
  }
}
