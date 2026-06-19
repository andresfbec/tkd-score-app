import '../../entities/combat_rounds_entity.dart';
import '../../repositories/combat_rounds_repository.dart';
import '../../repositories/versus_repository.dart';
import '../../repositories/combat_settings_repository.dart';

class InitializeCombatRounds {
  final CombatRoundsRepository combatRoundsRepository;
  final VersusRepository versusRepository;
  final CombatSettingsRepository combatSettingsRepository;

  InitializeCombatRounds({
    required this.combatRoundsRepository,
    required this.versusRepository,
    required this.combatSettingsRepository,
  });

  Future<List<CombatRoundsEntity>> call(int versusId) async {
    // 1. Verificar si ya existen rounds para este versus
    final existingRounds = await combatRoundsRepository.getByVersusId(versusId);
    if (existingRounds.isNotEmpty) {
      return existingRounds;
    }

    // 2. Obtener la información del Versus
    final versus = await versusRepository.getById(versusId);
    if (versus == null) {
      throw Exception("No se encontró el versus especificado.");
    }

    // 3. Obtener la configuración del torneo
    final combatSettings = await combatSettingsRepository.getByTournamentId(versus.tournamentId);
    final roundsMax = combatSettings?.roundsMax ?? 3; // Por defecto 3

    // 4. Generar y guardar los rounds en lote
    final newRounds = List.generate(roundsMax, (index) {
      return CombatRoundsEntity(
        versusId: versusId,
        roundNumber: index + 1,
        pointsA: 0,
        pointsB: 0,
        winnerInscriptionId: null,
        state: 'pending',
        startAt: DateTime.now(),
      );
    });

    await combatRoundsRepository.createBatch(newRounds);
    
    // Retornamos los rounds recién creados
    return await combatRoundsRepository.getByVersusId(versusId);
  }
}
