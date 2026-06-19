import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/entities/judge_entity.dart';
import '../../domain/usecases/judges/create_judge.dart';
import '../../domain/usecases/judges/update_judge.dart';
import '../../domain/usecases/judges/delete_judge.dart';
import '../../domain/usecases/judges/watch_judges.dart';
import '../../domain/usecases/judges/assign_judge_to_tournament.dart';
import '../../domain/usecases/judges/remove_judge_from_tournament.dart';
import '../../domain/usecases/judges/watch_judges_by_tournament.dart';

import '../../core/enums/status.dart';

class JudgesController extends ChangeNotifier {
  final CreateJudge createUseCase;
  final UpdateJudge updateUseCase;
  final DeleteJudge deleteUseCase;
  final WatchJudges watchUseCase;
  final AssignJudgeToTournament assignToTournamentUseCase;
  final RemoveJudgeFromTournament removeFromTournamentUseCase;
  final WatchJudgesByTournament watchByTournamentUseCase;

  JudgesController({
    required this.createUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
    required this.watchUseCase,
    required this.assignToTournamentUseCase,
    required this.removeFromTournamentUseCase,
    required this.watchByTournamentUseCase,
  });

  // ===============================
  // ESTADO (STATE)
  // ===============================
  List<JudgeEntity> _allJudges = [];
  List<JudgeEntity> _tournamentJudges = [];
  Status status = Status.idle;
  String? message;
  String _searchQuery = "";

  StreamSubscription<List<JudgeEntity>>? _subscription;
  StreamSubscription<List<JudgeEntity>>? _tournamentSubscription;

  List<JudgeEntity> get judges => _allJudges;
  List<JudgeEntity> get tournamentJudges => _tournamentJudges;

  // ===============================
  // GETTERS
  // ===============================
  
  List<JudgeEntity> get filteredJudges {
    if (_searchQuery.isEmpty) return _allJudges;
    final query = _searchQuery.toLowerCase();
    return _allJudges.where((j) {
      return j.names.toLowerCase().contains(query) ||
             j.document.contains(query);
    }).toList();
  }

  // ===============================
  // MÉTODOS DE FLUJO (STREAM)
  // ===============================

  void startListening({bool onlyActive = true}) {
    status = Status.loading;
    notifyListeners();

    _subscription?.cancel();
    _subscription = watchUseCase(onlyActive: onlyActive).listen(
      (data) {
        _allJudges = data;
        status = Status.success;
        notifyListeners();
      },
      onError: (error) {
        status = Status.error;
        message = 'Error en la conexión de datos: $error';
        notifyListeners();
      },
    );
  }

  void listenTournamentJudges(int tournamentId) {
    _tournamentSubscription?.cancel();
    _tournamentSubscription = watchByTournamentUseCase(tournamentId).listen(
      (data) {
        _tournamentJudges = data;
        notifyListeners();
      },
    );
  }

  // ===============================
  // OPERACIONES CRUD
  // ===============================

  Future<void> addJudge(JudgeEntity judge) async {
    try {
      status = Status.loading;
      notifyListeners();

      await createUseCase(judge);

      status = Status.success;
      message = "Juez registrado correctamente";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  Future<void> editJudge(JudgeEntity judge) async {
    try {
      status = Status.loading;
      notifyListeners();

      await updateUseCase(judge);

      status = Status.success;
      message = "Información actualizada correctamente";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  Future<void> removeJudge(int id) async {
    try {
      status = Status.loading;
      notifyListeners();

      await deleteUseCase(id);

      status = Status.success;
      message = "Juez eliminado o inactivado con éxito";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  // --- Relación con Torneos ---

  Future<void> assignToTournament(int judgeId, int tournamentId) async {
    try {
      await assignToTournamentUseCase(judgeId, tournamentId);
    } catch (e) {
      status = Status.error;
      message = e.toString();
      notifyListeners();
    }
  }

  Future<void> removeFromTournament(int judgeId, int tournamentId) async {
    try {
      await removeFromTournamentUseCase(judgeId, tournamentId);
    } catch (e) {
      status = Status.error;
      message = e.toString();
      notifyListeners();
    }
  }

  // ===============================
  // MÉTODOS SECUNDARIOS
  // ===============================

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void clearError() {
    status = Status.idle;
    message = null;
    notifyListeners();
  }

  void clearMessages() {
    status = Status.idle;
    message = null;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _tournamentSubscription?.cancel();
    super.dispose();
  }
}
