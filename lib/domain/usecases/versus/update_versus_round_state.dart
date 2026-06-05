import '../../repositories/versus_repository.dart';

class UpdateVersusRoundState {
  final VersusRepository repository;

  UpdateVersusRoundState(this.repository);

  Future<bool> call(int groupId, int bracketRound, String roundState) async {
    return await repository.updateRoundState(groupId, bracketRound, roundState);
  }
}
