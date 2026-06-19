import '../../repositories/judges_repository.dart';

class RemoveJudgeFromTournament {
  final JudgesRepository repository;

  RemoveJudgeFromTournament(this.repository);

  Future<void> call(int judgeId, int tournamentId) async {
    await repository.removeFromTournament(judgeId, tournamentId);
  }
}
