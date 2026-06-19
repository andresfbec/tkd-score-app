import '../../repositories/tournament_repository.dart';

class SyncTournamentSetupPhase {
  final TournamentRepository repository;

  SyncTournamentSetupPhase(this.repository);

  Future<void> call(int tournamentId) async {
    await repository.syncSetupPhase(tournamentId);
  }
}
