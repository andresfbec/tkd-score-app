import 'package:flutter/material.dart';
import '../../../domain/entities/versus_entity.dart';
import '../../../domain/usecases/versus/generate_group_bracket_usecase.dart';
import '../../../domain/usecases/versus/swap_versus_participants.dart';
import '../../../domain/repositories/inscriptions_repository.dart';
import '../../../domain/usecases/versus/update_versus_round_state.dart';
import '../../../domain/usecases/versus/advance_round_winners.dart';
import '../models/combat_bracket_models.dart';

class CombatVisualizationController extends ChangeNotifier {
  final GenerateGroupBracketUseCase _generateBracket;
  final InscriptionsRepository _inscriptionsRepository;
  final SwapVersusParticipants _swapParticipants;
  final UpdateVersusRoundState _updateVersusRoundState;
  final AdvanceRoundWinners _advanceRoundWinners;

  List<VersusEntity>? versus;
  List<BracketRound> rounds = [];
  bool loading = false;

  CombatVisualizationController(
    this._generateBracket,
    this._inscriptionsRepository,
    this._swapParticipants,
    this._updateVersusRoundState,
    this._advanceRoundWinners,
  );

  Future<void> loadBracket(int groupId, int tournamentId) async {
    loading = true;
    notifyListeners();

    try {
      // 1. Obtener o generar los enfrentamientos (versus) para el grupo
      final versusList = await _generateBracket(groupId, tournamentId);
      versus = versusList;

      if (versusList.isEmpty) {
        rounds = [];
        loading = false;
        notifyListeners();
        return;
      }

      // 2. Obtener los participantes inscritos y activos del grupo
      final inscriptionsList = await _inscriptionsRepository
          .watchInscriptions(groupId: groupId, onlyActive: true)
          .first;

      // Crear un mapa para búsquedas rápidas por ID
      final inscriptionsMap = {
        for (var ins in inscriptionsList) ins.id: ins,
      };

      // 3. Agrupar los versus por ronda y ordenarlos
      final Map<int, List<VersusEntity>> versusByRound = {};
      for (var vs in versusList) {
        versusByRound.putIfAbsent(vs.bracketRound, () => []).add(vs);
      }

      final maxRound = versusByRound.keys.isEmpty
          ? 0
          : versusByRound.keys.reduce((a, b) => a > b ? a : b);

      final List<BracketRound> computedRounds = [];

      for (int r = 1; r <= maxRound; r++) {
        final roundVersus = versusByRound[r] ?? [];
        // Ordenar por orden de bracket de manera ascendente
        roundVersus.sort((a, b) => a.bracketOrder.compareTo(b.bracketOrder));

        final List<MatchNode> matches = [];
        for (var vs in roundVersus) {
          matches.add(
            MatchNode(
              matchNumber: vs.bracketOrder,
              versus: vs,
              player1: inscriptionsMap[vs.inscriptionAId],
              player2: inscriptionsMap[vs.inscriptionBId],
              winner: inscriptionsMap[vs.winnerInscriptionId],
            ),
          );
        }

        // Definir un nombre amigable para la ronda
        String roundName;
        if (r == maxRound) {
          roundName = 'Gran Final';
        } else if (r == maxRound - 1 && maxRound > 1) {
          roundName = 'Semifinal';
        } else if (r == maxRound - 2 && maxRound > 2) {
          roundName = 'Cuartos de Final';
        } else {
          roundName = 'Ronda $r';
        }

        // El estado de la ronda se deriva del primer versus de la ronda (todas comparten el mismo estado)
        final roundState = roundVersus.isNotEmpty ? roundVersus.first.roundState : 'draft';

        computedRounds.add(
          BracketRound(
            roundIndex: r,
            name: roundName,
            state: roundState,
            matches: matches,
          ),
        );
      }

      rounds = computedRounds;
    } catch (e) {
      debugPrint('Error cargando el bracket: $e');
      rounds = [];
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> swapParticipants({
    required int versusIdA,
    required String slotA,
    required int versusIdB,
    required String slotB,
    required int groupId,
    required int tournamentId,
  }) async {
    loading = true;
    notifyListeners();
    try {
      await _swapParticipants(
        versusIdA: versusIdA,
        slotA: slotA,
        versusIdB: versusIdB,
        slotB: slotB,
      );
      // Recargar el bracket para reflejar el swap
      await loadBracket(groupId, tournamentId);
    } catch (e) {
      debugPrint('Error en swap de participantes: $e');
      loading = false;
      notifyListeners();
    }
  }

  Future<void> confirmRound({
    required int groupId,
    required int bracketRound,
    required int tournamentId,
  }) async {
    loading = true;
    notifyListeners();
    try {
      await _updateVersusRoundState(groupId, bracketRound, 'confirmed');
      // Recargar para refrescar los datos desde la BD
      await loadBracket(groupId, tournamentId);
    } catch (e) {
      debugPrint('Error al confirmar la ronda: $e');
      loading = false;
      notifyListeners();
    }
  }

  Future<void> advanceWinners({
    required int groupId,
    required int currentRound,
    required int tournamentId,
  }) async {
    loading = true;
    notifyListeners();
    try {
      await _advanceRoundWinners(groupId, currentRound);
      // Volver a cargar el bracket para reflejar los competidores avanzados
      await loadBracket(groupId, tournamentId);
    } catch (e) {
      debugPrint('Error al avanzar ganadores: $e');
      loading = false;
      notifyListeners();
    }
  }
}