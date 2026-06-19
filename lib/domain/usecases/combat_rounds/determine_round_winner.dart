import '../../entities/combat_events_entity.dart';
import '../../entities/point_types_entity.dart';

/// Determina el ganador de un round basado en puntos y reglas oficiales WT
class DetermineRoundWinner {
  int? call({
    required int pointsA,
    required int pointsB,
    required int? inscriptionAId,
    required int? inscriptionBId,
    required List<CombatEventsEntity> events,
    required List<PointTypesEntity> pointTypes,
  }) {
    if (inscriptionAId == null || inscriptionBId == null) return null;

    final pointTypesMap = {for (var pt in pointTypes) pt.id: pt};
    int penaltiesA = 0;
    int penaltiesB = 0;

    for (final event in events) {
      if (event.isValid != 1) continue;
      final type = pointTypesMap[event.pointTypeId];
      if (type == null) continue;
      if (type.isPenalty) {
        if (event.targetParticipant == 'A') {
          penaltiesA++;
        } else {
          penaltiesB++;
        }
      }
    }

    // Regla 1: 5 Gam-jeons es pérdida automática
    if (penaltiesA >= 5 && penaltiesB < 5) {
      return inscriptionBId; // A pierde, B gana
    }
    if (penaltiesB >= 5 && penaltiesA < 5) {
      return inscriptionAId; // B pierde, A gana
    }
    if (penaltiesA >= 5 && penaltiesB >= 5) {
      // Caso extremo: Ambos alcanzan penalización máxima, desempate normal
    }

    // Comparar puntos normales
    if (pointsA > pointsB) {
      return inscriptionAId;
    } else if (pointsB > pointsA) {
      return inscriptionBId;
    }

    // --- CRITERIOS DE DESEMPATE (TIE-BREAKERS) ---

    // 1º Criterio: Puntos por técnicas de mayor valor
    // Prioridad:
    // 5: SPINNING_KICK / HEAD (Giro Cabeza)
    // 4: SPINNING_KICK / TRUNK (Giro Peto)
    // 3: REGULAR_KICK / HEAD (Directa Cabeza)
    // 2: REGULAR_KICK / TRUNK (Directa Peto)
    // 1: PUNCH (Puño)
    final countsA = <int, int>{5: 0, 4: 0, 3: 0, 2: 0, 1: 0};
    final countsB = <int, int>{5: 0, 4: 0, 3: 0, 2: 0, 1: 0};

    for (final event in events) {
      if (event.isValid != 1) continue;
      final type = pointTypesMap[event.pointTypeId];
      if (type == null) continue;

      int priority = 0;
      if (type.techniqueType == 'SPINNING_KICK' && type.bodyZone == 'HEAD') {
        priority = 5;
      } else if (type.techniqueType == 'SPINNING_KICK' && type.bodyZone == 'TRUNK') {
        priority = 4;
      } else if (type.techniqueType == 'REGULAR_KICK' && type.bodyZone == 'HEAD') {
        priority = 3;
      } else if (type.techniqueType == 'REGULAR_KICK' && type.bodyZone == 'TRUNK') {
        priority = 2;
      } else if (type.techniqueType == 'PUNCH') {
        priority = 1;
      }

      if (priority > 0) {
        if (event.targetParticipant == 'A') {
          countsA[priority] = (countsA[priority] ?? 0) + 1;
        } else {
          countsB[priority] = (countsB[priority] ?? 0) + 1;
        }
      }
    }

    for (int p = 5; p >= 1; p--) {
      final cntA = countsA[p] ?? 0;
      final cntB = countsB[p] ?? 0;
      if (cntA > cntB) return inscriptionAId;
      if (cntB > cntA) return inscriptionBId;
    }

    // 2º Criterio: Mayor número de impactos registrados (omitido / tratado como igual por no registrar golpes electrónicos sin punto)

    // 3º Criterio: Menos Gam-jeon (Penalizaciones)
    if (penaltiesA < penaltiesB) return inscriptionAId;
    if (penaltiesB < penaltiesA) return inscriptionBId;

    // 4º Criterio: Superioridad decidida por jueces (Retorna null para requerir voto manual en interfaz)
    return null;
  }
}
