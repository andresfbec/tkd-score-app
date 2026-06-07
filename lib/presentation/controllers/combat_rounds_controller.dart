import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/entities/combat_rounds_entity.dart';
import '../../domain/entities/versus_entity.dart';
import '../../domain/entities/combat_settings_entity.dart';
import '../../domain/usecases/combat_rounds/create_combat_round.dart';
import '../../domain/usecases/combat_rounds/create_batch_combat_rounds.dart';
import '../../domain/usecases/combat_rounds/update_combat_round.dart';
import '../../domain/usecases/combat_rounds/delete_combat_round.dart';
import '../../domain/usecases/combat_rounds/get_combat_round_by_id.dart';
import '../../domain/usecases/combat_rounds/get_combat_rounds_by_versus_id.dart';
import '../../domain/usecases/combat_rounds/watch_combat_rounds_by_versus_id.dart';
import '../../domain/usecases/combat_rounds/update_combat_round_state.dart';
import '../../domain/usecases/combat_rounds/update_combat_round_points.dart';
import '../../domain/usecases/combat_rounds/set_combat_round_winner.dart';
import '../../domain/usecases/combat_rounds/are_all_rounds_complete.dart';
import '../../domain/usecases/combat_rounds/get_active_combat_round.dart';
import '../../domain/usecases/combat_rounds/delete_all_combat_rounds_by_versus.dart';
import '../../domain/usecases/combat_rounds/initialize_combat_rounds.dart';
import '../../domain/usecases/versus/get_versus_by_id.dart';
import '../../domain/usecases/combat_settings/get_combat_setting_by_tournament_id.dart';
import '../../domain/usecases/combat_rounds/get_executable_round.dart';
import '../../domain/usecases/versus/evaluate_versus_completion.dart';
import '../../domain/usecases/versus/set_versus_winner.dart';
import '../../domain/usecases/combat_rounds/determine_round_winner.dart';

import '../../core/enums/status.dart';

class CombatRoundsController extends ChangeNotifier {
  final CreateCombatRound createUseCase;
  final CreateBatchCombatRounds createBatchUseCase;
  final UpdateCombatRound updateUseCase;
  final DeleteCombatRound deleteUseCase;
  final GetCombatRoundById getByIdUseCase;
  final GetCombatRoundsByVersusId getByVersusIdUseCase;
  final WatchCombatRoundsByVersusId watchByVersusIdUseCase;
  final UpdateCombatRoundState updateStateUseCase;
  final UpdateCombatRoundPoints updatePointsUseCase;
  final SetCombatRoundWinner setWinnerUseCase;
  final AreAllRoundsComplete areAllRoundsCompleteUseCase;
  final GetActiveCombatRound getActiveRoundUseCase;
  final DeleteAllCombatRoundsByVersus deleteAllByVersusUseCase;
  final InitializeCombatRounds initializeUseCase;
  final GetVersusById getVersusByIdUseCase;
  final GetCombatSettingByTournamentId getCombatSettingByTournamentIdUseCase;
  final GetExecutableRound getExecutableRoundUseCase;
  final EvaluateVersusCompletion evaluateVersusCompletionUseCase;
  final SetVersusWinner setVersusWinnerUseCase;
  final DetermineRoundWinner determineRoundWinnerUseCase;

  CombatRoundsController({
    required this.createUseCase,
    required this.createBatchUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
    required this.getByIdUseCase,
    required this.getByVersusIdUseCase,
    required this.watchByVersusIdUseCase,
    required this.updateStateUseCase,
    required this.updatePointsUseCase,
    required this.setWinnerUseCase,
    required this.areAllRoundsCompleteUseCase,
    required this.getActiveRoundUseCase,
    required this.deleteAllByVersusUseCase,
    required this.initializeUseCase,
    required this.getVersusByIdUseCase,
    required this.getCombatSettingByTournamentIdUseCase,
    required this.getExecutableRoundUseCase,
    required this.evaluateVersusCompletionUseCase,
    required this.setVersusWinnerUseCase,
    required this.determineRoundWinnerUseCase,
  });

  List<CombatRoundsEntity> _rounds = [];
  Status status = Status.idle;
  String? message;

  StreamSubscription<List<CombatRoundsEntity>>? _subscription;

  VersusEntity? _versus;
  CombatSettingsEntity? _combatSettings;
  CombatRoundsEntity? _executableRound;
  int? _matchWinnerId;

  List<CombatRoundsEntity> get rounds => _rounds;
  VersusEntity? get versus => _versus;
  CombatSettingsEntity? get combatSettings => _combatSettings;
  CombatRoundsEntity? get executableRound => _executableRound;
  int? get matchWinnerId => _matchWinnerId;

  Future<void> initializeCombatRounds(int versusId) async {
    try {
      status = Status.loading;
      notifyListeners();
      await initializeUseCase(versusId);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  void startListening(int versusId) async {
    status = Status.loading;
    notifyListeners();

    try {
      _versus = await getVersusByIdUseCase(versusId);
      if (_versus != null) {
        _combatSettings = await getCombatSettingByTournamentIdUseCase(_versus!.tournamentId);
      }
    } catch (e) {
      print("Error loading versus/settings: $e");
    }

    _subscription?.cancel();
    _subscription = watchByVersusIdUseCase(versusId).listen(
      (data) {
        _rounds = data;
        _updateStateAndWinner();
        status = Status.success;
        notifyListeners();
      },
      onError: (error) {
        status = Status.error;
        message = error.toString();
        notifyListeners();
      },
    );
  }

  void _updateStateAndWinner() {
    if (_versus == null || _combatSettings == null) return;

    _matchWinnerId = evaluateVersusCompletionUseCase(
      settings: _combatSettings!,
      rounds: _rounds,
      inscriptionAId: _versus!.inscriptionAId ?? 0,
      inscriptionBId: _versus!.inscriptionBId ?? 0,
    );

    _executableRound = getExecutableRoundUseCase(
      rounds: _rounds,
      matchWinnerId: _matchWinnerId,
    );
  }

  Future<void> finalizeVersus() async {
    if (_versus == null || _matchWinnerId == null) return;
    try {
      status = Status.loading;
      notifyListeners();
      await setVersusWinnerUseCase(_versus!.id!, _matchWinnerId!);
      _versus = await getVersusByIdUseCase(_versus!.id!);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> addRound(CombatRoundsEntity round) async {
    try {
      status = Status.loading;
      notifyListeners();
      await createUseCase(round);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> addBatchRounds(List<CombatRoundsEntity> rounds) async {
    try {
      status = Status.loading;
      notifyListeners();
      await createBatchUseCase(rounds);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> updateRound(CombatRoundsEntity round) async {
    try {
      status = Status.loading;
      notifyListeners();
      await updateUseCase(round);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> deleteRound(int id) async {
    try {
      status = Status.loading;
      notifyListeners();
      await deleteUseCase(id);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> updateState(int roundId, String state) async {
    try {
      status = Status.loading;
      notifyListeners();
      await updateStateUseCase(roundId, state);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> updatePoints(int roundId, {required int pointsA, required int pointsB}) async {
    try {
      status = Status.loading;
      notifyListeners();
      await updatePointsUseCase(roundId, pointsA: pointsA, pointsB: pointsB);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> setWinner(int roundId, int winnerInscriptionId) async {
    try {
      status = Status.loading;
      notifyListeners();
      await setWinnerUseCase(roundId, winnerInscriptionId);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  int? determineRoundWinner({
    required int pointsA,
    required int pointsB,
    required int? inscriptionAId,
    required int? inscriptionBId,
  }) {
    return determineRoundWinnerUseCase(
      pointsA: pointsA,
      pointsB: pointsB,
      inscriptionAId: inscriptionAId,
      inscriptionBId: inscriptionBId,
    );
  }

  Future<bool> checkAllRoundsComplete(int versusId) async {
    return await areAllRoundsCompleteUseCase(versusId);
  }

  Future<CombatRoundsEntity?> getActiveRound(int versusId) async {
    return await getActiveRoundUseCase(versusId);
  }

  Future<void> deleteAllByVersus(int versusId) async {
    try {
      status = Status.loading;
      notifyListeners();
      await deleteAllByVersusUseCase(versusId);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
