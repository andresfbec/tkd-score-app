import '../../repositories/versus_repository.dart';

class SetVersusWinner {
  final VersusRepository repository;

  SetVersusWinner(this.repository);

  Future<bool> call(int versusId, int winnerInscriptionId) async {
    return await repository.setWinner(versusId, winnerInscriptionId);
  }
}
