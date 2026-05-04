import '../../repositories/judges_repository.dart';

class AssignJudgeToTournament {
  final JudgesRepository repository;

  AssignJudgeToTournament(this.repository);

  Future<void> call(int judgeId, int tournamentId) async {
    await repository.assignToTournament(judgeId, tournamentId);
  }
}
