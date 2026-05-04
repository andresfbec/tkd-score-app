import '../../entities/judge_entity.dart';
import '../../repositories/judges_repository.dart';

class WatchJudgesByTournament {
  final JudgesRepository repository;

  WatchJudgesByTournament(this.repository);

  Stream<List<JudgeEntity>> call(int tournamentId) {
    return repository.watchJudgesByTournament(tournamentId);
  }
}
