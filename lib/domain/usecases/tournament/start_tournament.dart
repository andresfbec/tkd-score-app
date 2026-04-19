import '../../../core/constants/tournament_lifecycle.dart';
import '../../entities/tournament_entity.dart';
import '../../repositories/tournament_repository.dart';
import '../../errors/exceptions.dart';

/// Pasa el torneo a [TournamentLifecycle.live] solo si está listo para iniciar.
class StartTournament {
  final TournamentRepository repository;

  StartTournament(this.repository);

  Future<bool> call(
    int id, {
    bool hasCombatSettings = false,
    bool hasGroupsDefined = false,
  }) async {
    final existing = await repository.getById(id);
    if (existing == null) {
      throw TournamentNotFoundException();
    }

    final phase = TournamentLifecycle.normalize(existing.setupPhase);
    if (phase == TournamentLifecycle.live ||
        phase == TournamentLifecycle.finished) {
      throw TournamentLockedException();
    }

    final canStart = TournamentLifecycle.canShowStartButton(
      phase: existing.setupPhase,
      hasCombatSettings: hasCombatSettings,
      hasGroupsDefined: hasGroupsDefined,
    );

    if (!canStart) {
      throw TournamentNotReadyToStartException();
    }

    final updated = TournamentEntity(
      id: existing.id,
      name: existing.name,
      host: existing.host,
      location: existing.location,
      dateStart: existing.dateStart,
      dateEnd: existing.dateEnd,
      status: existing.status,
      discipline: existing.discipline,
      setupPhase: TournamentLifecycle.live,
    );

    return repository.update(updated);
  }
}
