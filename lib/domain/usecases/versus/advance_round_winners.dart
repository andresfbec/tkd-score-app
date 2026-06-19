import '../../repositories/versus_repository.dart';

class AdvanceRoundWinners {
  final VersusRepository repository;

  AdvanceRoundWinners(this.repository);

  Future<void> call(int groupId, int currentRound) async {
    // 1. Obtener todos los enfrentamientos de la ronda actual
    final currentMatches = await repository.getByGroupAndRound(groupId, currentRound);
    
    // 2. Iterar y avanzar los ganadores al versus de la siguiente ronda
    for (var match in currentMatches) {
      final winnerId = match.winnerInscriptionId;
      final nextVsId = match.nextVsWinnerId;
      
      if (winnerId != null && nextVsId != null) {
        final nextMatch = await repository.getById(nextVsId);
        if (nextMatch != null) {
          if (match.bracketOrder % 2 != 0) {
            // Orden impar -> Va al slot A del siguiente combate
            await repository.update(nextMatch.copyWith(inscriptionAId: winnerId));
          } else {
            // Orden par -> Va al slot B del siguiente combate
            await repository.update(nextMatch.copyWith(inscriptionBId: winnerId));
          }
        }
      }
    }
  }
}
