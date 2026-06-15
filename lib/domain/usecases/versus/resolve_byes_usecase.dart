import '../../repositories/versus_repository.dart';

class ResolveByes {
  final VersusRepository repository;

  ResolveByes(this.repository);

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

        print('   ✅ Bye resuelto: Versus ${bye.id}, Ganador: ${bye.inscriptionAId}');
      }
    }

    print('   ✨ Todos los byes han sido resueltos');
  }
}
