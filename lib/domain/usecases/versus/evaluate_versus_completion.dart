import '../../entities/combat_settings_entity.dart';
import '../../entities/combat_rounds_entity.dart';

class EvaluateVersusCompletion {
  /// Devuelve el winnerInscriptionId (int) si el versus ha terminado, o null si debe continuar.
  int? call({
    required CombatSettingsEntity settings,
    required List<CombatRoundsEntity> rounds,
    required int inscriptionAId,
    required int inscriptionBId,
  }) {
    if (rounds.isEmpty) return null;

    final format = settings.formatType; // 'best_of_rounds' o 'points'
    final roundsMax = settings.roundsMax; // 1, 3, 5

    // Contar victorias por round si es 'best_of_rounds'
    if (format == 'best_of_rounds') {
      int winsA = 0;
      int winsB = 0;
      int completedRounds = 0;

      for (final r in rounds) {
        if (r.state == 'completed') {
          completedRounds++;
          if (r.winnerInscriptionId == inscriptionAId) {
            winsA++;
          } else if (r.winnerInscriptionId == inscriptionBId) {
            winsB++;
          }
        }
      }

      final majorityToWin = (roundsMax / 2).floor() + 1; // 2 para 3 rounds, 3 para 5, 1 para 1

      if (winsA >= majorityToWin) {
        return inscriptionAId;
      }
      if (winsB >= majorityToWin) {
        return inscriptionBId;
      }

      // Si se completaron todos los rounds posibles
      if (completedRounds >= roundsMax) {
        if (winsA > winsB) return inscriptionAId;
        if (winsB > winsA) return inscriptionBId;
        return inscriptionAId; // Fallback
      }

      return null;
    } else {
      // Formato 'points' o de acumulación
      final allCompleted = rounds.length >= roundsMax && rounds.every((r) => r.state == 'completed');
      if (!allCompleted) return null;

      int totalPointsA = 0;
      int totalPointsB = 0;
      for (final r in rounds) {
        totalPointsA += r.pointsA;
        totalPointsB += r.pointsB;
      }

      if (totalPointsA > totalPointsB) {
        return inscriptionAId;
      } else if (totalPointsB > totalPointsA) {
        return inscriptionBId;
      } else {
        if (rounds.isNotEmpty && rounds.last.winnerInscriptionId != null) {
          return rounds.last.winnerInscriptionId;
        }
        return inscriptionAId; // Fallback
      }
    }
  }
}
