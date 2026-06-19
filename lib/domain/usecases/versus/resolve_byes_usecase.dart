import '../../repositories/versus_repository.dart';
import '../../repositories/combat_rounds_repository.dart';

class ResolveByes {
  final VersusRepository repository;
  final CombatRoundsRepository combatRoundsRepository;

  ResolveByes(this.repository, this.combatRoundsRepository);

  /// Resuelve todos los byes de la Ronda 1 de un grupo:
  /// - Identifica versus donde inscriptionBId es null (bye)
  /// - Asigna automáticamente al inscriptionAId como ganador
  /// - Cambia el state a 'completed'
  /// 
  /// Esto se llama cuando se CONFIRMA la Ronda 1 (después de permitir reordenamientos).
  Future<void> call(int groupId) async {
    // 1. Obtener todos los versus de la Ronda 1
    final round1Versus = await repository.getByGroupAndRound(groupId, 1);

    // 2. Filtrar solo los byes (inscriptionBId == null)
    final byes = round1Versus.where((vs) => vs.inscriptionBId == null).toList();

    print('🔄 [ResolveByes] Resolviendo ${byes.length} byes de Ronda 1...');

    // 3. Para cada bye, asignar ganador y marcar como completed
    for (var bye in byes) {
      if (bye.inscriptionAId != null) {
        final updatedBye = bye.copyWith(
          winnerInscriptionId: bye.inscriptionAId,
          state: 'completed',
        );

        await repository.update(updatedBye);

        // Marcar todos los combat rounds del bye como completed
        final rounds = await combatRoundsRepository.getByVersusId(bye.id!);
        for (final round in rounds) {
          await combatRoundsRepository.update(
            round.copyWith(
              state: 'completed',
              winnerInscriptionId: bye.inscriptionAId,
              endAt: DateTime.now(),
            ),
          );
        }

        print('   ✅ Bye resuelto: Versus ${bye.id}, Ganador: ${bye.inscriptionAId}');
      }
    }

    print('   ✨ Todos los byes han sido resueltos');
  }
}
