/// Determina el ganador de un round basado en puntos
/// Regla de negocio: Si hay empate, gana inscriptionA por defecto
class DetermineRoundWinner {
  int? call({
    required int pointsA,
    required int pointsB,
    required int? inscriptionAId,
    required int? inscriptionBId,
  }) {
    if (inscriptionAId == null || inscriptionBId == null) return null;
    
    if (pointsA > pointsB) {
      return inscriptionAId;
    } else if (pointsB > pointsA) {
      return inscriptionBId;
    } else {
      // Desempate: gana inscriptionA por defecto
      return inscriptionAId;
    }
  }
}
