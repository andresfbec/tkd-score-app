import '../../repositories/versus_repository.dart';

class IsVersusRoundComplete {
  final VersusRepository repository;

  IsVersusRoundComplete(this.repository);

  Future<bool> call(int groupId, int bracketRound) async {
    return await repository.isRoundComplete(groupId, bracketRound);
  }
}
