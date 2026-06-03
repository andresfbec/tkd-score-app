import 'dart:math';
import '../../entities/inscriptions_entity.dart';
import '../../entities/versus_entity.dart';
import '../../entities/combat_rounds_entity.dart';
import '../../repositories/inscriptions_repository.dart';
import '../../repositories/versus_repository.dart';
import '../../repositories/combat_settings_repository.dart';
import '../../repositories/combat_rounds_repository.dart';

class GenerateGroupBracketUseCase {
  final InscriptionsRepository inscriptionsRepository;
  final VersusRepository versusRepository;
  final CombatSettingsRepository combatSettingsRepository;
  final CombatRoundsRepository combatRoundsRepository;

  GenerateGroupBracketUseCase({
    required this.inscriptionsRepository,
    required this.versusRepository,
    required this.combatSettingsRepository,
    required this.combatRoundsRepository,
  });

  /// Inicializa la estructura de llaves (bracket) de un grupo del torneo si no ha sido creada.
  /// 
  /// Si ya existen combates para este [groupId], simplemente los retorna sin sobreescribir.
  /// Obtiene las reglas del torneo de [CombatSettingsRepository] para inicializar los
  /// rounds correspondientes a cada combate en la base de datos a través de [CombatRoundsRepository].
  Future<List<VersusEntity>> call(int groupId, int tournamentId) async {
    // 1. Validar si ya existen combates para este grupo para evitar borrar el progreso
    final existingVersus = await versusRepository.getByGroupId(groupId);
    if (existingVersus.isNotEmpty) {
      return existingVersus;
    }

    // 2. Obtener la configuración del torneo para los combates (cantidad de rounds)
    final settings = await combatSettingsRepository.getByTournamentId(tournamentId);
    final roundsMax = settings?.roundsMax ?? 3; // Fallback por defecto a 3 rounds

    // 3. Obtener inscritos activos del grupo
    final inscriptions = await inscriptionsRepository
        .watchInscriptions(groupId: groupId, onlyActive: true)
        .first;

    final pCount = inscriptions.length;
    if (pCount < 2) {
      // Se requieren al menos 2 participantes para generar una llave
      return [];
    }

    // 4. Calcular N (Potencia de 2 más cercana mayor o igual a pCount)
    int n = 1;
    while (n < pCount) {
      n *= 2;
    }

    // 5. Calcular Byes
    final bCount = n - pCount;

    // 6. Mezclar participantes aleatoriamente
    final shuffled = List<InscriptionsEntity>.from(inscriptions)..shuffle();

    // 7. Calcular cantidad total de rondas: R = log2(N)
    final totalRounds = (log(n) / log(2)).round();

    // Estructura para almacenar las referencias del árbol
    // Key: "ronda-orden", Value: ID de versus en la base de datos
    final Map<String, int> insertedIds = {};
    int playerIndex = 0;
    
    // Lista de entidades generadas con sus IDs finales
    final List<VersusEntity> allGeneratedVersus = [];

    // Cantidad de combates de primera ronda con 1 jugador y 1 Bye
    final matchesWithBye = bCount;

    // 8. Generar las rondas de atrás hacia adelante (de la Final a la Ronda 1)
    // para poder linkear [nextVsWinnerId] con IDs reales de base de datos ya creados.
    for (int r = totalRounds; r >= 1; r--) {
      final numMatches = 1 << (totalRounds - r); // 2^(R - r) combates
      final List<VersusEntity> roundEntities = [];

      for (int m = 1; m <= numMatches; m++) {
        int? inscriptionAId;
        int? inscriptionBId;

        // Si es la ronda 1, asignamos participantes reales y Byes
        if (r == 1) {
          final matchIdx = m - 1;
          if (matchIdx < matchesWithBye) {
            inscriptionAId = shuffled[playerIndex++].id;
            inscriptionBId = null; // Bye
          } else {
            inscriptionAId = shuffled[playerIndex++].id;
            inscriptionBId = shuffled[playerIndex++].id;
          }
        }

        // Linkear con el versus de la siguiente ronda
        int? nextVsWinnerId;
        if (r < totalRounds) {
          nextVsWinnerId = insertedIds["${r + 1}-${(m + 1) ~/ 2}"];
        }

        final vs = VersusEntity(
          tournamentId: tournamentId,
          groupId: groupId,
          inscriptionAId: inscriptionAId,
          inscriptionBId: inscriptionBId,
          bracketRound: r,
          bracketOrder: m,
          nextVsWinnerId: nextVsWinnerId,
          state: 'pending',
          roundState: 'draft',
        );

        // Guardar en base de datos para obtener el ID real
        final insertedId = await versusRepository.create(vs);
        insertedIds["$r-$m"] = insertedId;

        // 9. Crear los rounds correspondientes al combate según las reglas del torneo
        final List<CombatRoundsEntity> combatRounds = List.generate(
          roundsMax,
          (index) => CombatRoundsEntity(
            versusId: insertedId,
            roundNumber: index + 1,
            state: 'pending',
            startAt: DateTime.now(),
          ),
        );
        await combatRoundsRepository.createBatch(combatRounds);

        // Guardar la entidad final con su ID real asignado
        roundEntities.add(vs.copyWith(id: insertedId));
      }

      // Insertar al inicio de la lista para que el resultado final
      // quede ordenado desde Ronda 1 en adelante
      allGeneratedVersus.insertAll(0, roundEntities);
    }

    return allGeneratedVersus;
  }
}
