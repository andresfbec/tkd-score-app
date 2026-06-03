import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/entities/versus_entity.dart';
import '../../domain/usecases/versus/create_versus.dart';
import '../../domain/usecases/versus/create_batch_versus.dart';
import '../../domain/usecases/versus/update_versus.dart';
import '../../domain/usecases/versus/delete_versus.dart';
import '../../domain/usecases/versus/delete_all_versus_by_group.dart';
import '../../domain/usecases/versus/get_versus_by_id.dart';
import '../../domain/usecases/versus/get_versus_by_group_id.dart';
import '../../domain/usecases/versus/get_versus_by_group_and_round.dart';
import '../../domain/usecases/versus/get_versus_by_tournament_id.dart';
import '../../domain/usecases/versus/watch_versus_by_group_id.dart';
import '../../domain/usecases/versus/watch_versus_by_group_and_round.dart';
import '../../domain/usecases/versus/update_versus_state.dart';
import '../../domain/usecases/versus/set_versus_winner.dart';
import '../../domain/usecases/versus/swap_versus_participants.dart';
import '../../domain/usecases/versus/is_versus_round_complete.dart';
import '../../domain/usecases/versus/get_max_bracket_round.dart';
import '../../domain/usecases/versus/generate_group_bracket_usecase.dart';

import '../../core/enums/status.dart';

class VersusController extends ChangeNotifier {
  final CreateVersus createUseCase;
  final CreateBatchVersus createBatchUseCase;
  final UpdateVersus updateUseCase;
  final DeleteVersus deleteUseCase;
  final DeleteAllVersusByGroup deleteAllByGroupUseCase;
  final GetVersusById getByIdUseCase;
  final GetVersusByGroupId getByGroupIdUseCase;
  final GetVersusByGroupAndRound getByGroupAndRoundUseCase;
  final GetVersusByTournamentId getByTournamentIdUseCase;
  final WatchVersusByGroupId watchByGroupIdUseCase;
  final WatchVersusByGroupAndRound watchByGroupAndRoundUseCase;
  final UpdateVersusState updateStateUseCase;
  final SetVersusWinner setWinnerUseCase;
  final SwapVersusParticipants swapParticipantsUseCase;
  final IsVersusRoundComplete isRoundCompleteUseCase;
  final GetMaxBracketRound getMaxBracketRoundUseCase;
  final GenerateGroupBracketUseCase generateGroupBracketUseCase;

  VersusController({
    required this.createUseCase,
    required this.createBatchUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
    required this.deleteAllByGroupUseCase,
    required this.getByIdUseCase,
    required this.getByGroupIdUseCase,
    required this.getByGroupAndRoundUseCase,
    required this.getByTournamentIdUseCase,
    required this.watchByGroupIdUseCase,
    required this.watchByGroupAndRoundUseCase,
    required this.updateStateUseCase,
    required this.setWinnerUseCase,
    required this.swapParticipantsUseCase,
    required this.isRoundCompleteUseCase,
    required this.getMaxBracketRoundUseCase,
    required this.generateGroupBracketUseCase,
  });

  List<VersusEntity> _versusList = [];
  Status status = Status.idle;
  String? message;

  StreamSubscription<List<VersusEntity>>? _subscription;

  List<VersusEntity> get versusList => _versusList;

  void startListeningByGroup(int groupId) {
    status = Status.loading;
    notifyListeners();

    _subscription?.cancel();
    _subscription = watchByGroupIdUseCase(groupId).listen(
      (data) {
        _versusList = data;
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

  void startListeningByGroupAndRound(int groupId, int bracketRound) {
    status = Status.loading;
    notifyListeners();

    _subscription?.cancel();
    _subscription = watchByGroupAndRoundUseCase(groupId, bracketRound).listen(
      (data) {
        _versusList = data;
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

  Future<void> addVersus(VersusEntity versus) async {
    try {
      status = Status.loading;
      notifyListeners();
      await createUseCase(versus);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> addBatchVersus(List<VersusEntity> versusList) async {
    try {
      status = Status.loading;
      notifyListeners();
      await createBatchUseCase(versusList);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> updateVersus(VersusEntity versus) async {
    try {
      status = Status.loading;
      notifyListeners();
      await updateUseCase(versus);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> deleteVersus(int id) async {
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

  Future<void> deleteAllByGroup(int groupId) async {
    try {
      status = Status.loading;
      notifyListeners();
      await deleteAllByGroupUseCase(groupId);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<VersusEntity?> getVersusById(int id) async {
    return await getByIdUseCase(id);
  }

  Future<List<VersusEntity>> getVersusByTournament(int tournamentId) async {
    return await getByTournamentIdUseCase(tournamentId);
  }

  Future<void> updateState(int versusId, String state) async {
    try {
      status = Status.loading;
      notifyListeners();
      await updateStateUseCase(versusId, state);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> setWinner(int versusId, int winnerInscriptionId) async {
    try {
      status = Status.loading;
      notifyListeners();
      await setWinnerUseCase(versusId, winnerInscriptionId);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> swapParticipants({
    required int versusIdA,
    required String slotA,
    required int versusIdB,
    required String slotB,
  }) async {
    try {
      status = Status.loading;
      notifyListeners();
      await swapParticipantsUseCase(
        versusIdA: versusIdA,
        slotA: slotA,
        versusIdB: versusIdB,
        slotB: slotB,
      );
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<bool> checkRoundComplete(int groupId, int bracketRound) async {
    return await isRoundCompleteUseCase(groupId, bracketRound);
  }

  Future<int> getMaxRound(int groupId) async {
    return await getMaxBracketRoundUseCase(groupId);
  }


  // eliminado porque es redundante con el metodo combate_visualization_controller.loadBracket, que a su vez es mas especifico para el caso de uso de visualizacion de combates. Ademas, este metodo no se estaba utilizando en ningun lugar del codigo.
  // Future<List<VersusEntity>> generateGroupBracket(int groupId, int tournamentId) async {
  //   try {
  //     status = Status.loading;
  //     notifyListeners();
  //     final result = await generateGroupBracketUseCase(groupId, tournamentId);
  //     status = Status.success;
  //     notifyListeners();
  //     return result;
  //   } catch (e) {
  //     status = Status.error;
  //     message = e.toString();
  //     notifyListeners();
  //     rethrow;
  //   }
  // }


  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
