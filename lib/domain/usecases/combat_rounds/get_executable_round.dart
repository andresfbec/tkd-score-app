import '../../entities/combat_rounds_entity.dart';

class GetExecutableRound {
  /// Devuelve el primer round 'pending' o 'active' en orden numérico si el combate no ha finalizado
  CombatRoundsEntity? call({
    required List<CombatRoundsEntity> rounds,
    int? matchWinnerId,
  }) {
    if (matchWinnerId != null) return null;

    final sorted = List<CombatRoundsEntity>.from(rounds)
      ..sort((a, b) => a.roundNumber.compareTo(b.roundNumber));

    for (final r in sorted) {
      if (r.state == 'pending' || r.state == 'active') {
        return r;
      }
    }
    return null;
  }
}
