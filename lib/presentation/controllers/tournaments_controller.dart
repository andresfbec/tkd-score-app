import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/tournament_lifecycle.dart';
import '../../domain/entities/tournament_entity.dart';
import '../../domain/usecases/tournament/create_tournament.dart';
import '../../domain/usecases/tournament/update_tournament.dart';
import '../../domain/usecases/tournament/delete_tournament.dart';
import '../../domain/usecases/tournament/find_tournaments.dart';
import '../../domain/usecases/tournament/watch_tournaments.dart';
import '../../domain/usecases/tournament/start_tournament.dart';

import '../../core/enums/status.dart';

class TournamentsController extends ChangeNotifier {
  final CreateTournament create;
  final UpdateTournament update;
  final DeleteTournament delete;
  final FindTournaments find;
  final WatchTournaments watch;
  final StartTournament startTournamentUseCase;

  TournamentsController(
    this.create,
    this.update,
    this.delete,
    this.find,
    this.watch,
    this.startTournamentUseCase,
  );

  List<TournamentEntity> _all = [];
  Status status = Status.idle;
  String? message;
  String _searchQuery = '';
  StreamSubscription<List<TournamentEntity>>? _subscription;

  List<TournamentEntity> get tournaments => _all;

  List<TournamentEntity> get filteredTournaments {
    if (_searchQuery.isEmpty) return _all;
    final q = _searchQuery.toLowerCase();
    return _all.where((t) {
      final phaseLabel =
          TournamentLifecycle.labelEs(t.setupPhase).toLowerCase();
      return t.name.toLowerCase().contains(q) ||
          t.location.toLowerCase().contains(q) ||
          t.host.toLowerCase().contains(q) ||
          phaseLabel.contains(q) ||
          t.discipline.toLowerCase().contains(q);
    }).toList();
  }

  void startListening() {
    status = Status.loading;
    notifyListeners();

    _subscription?.cancel();
    _subscription = watch().listen(
      (data) {
        _all = data;
        status = Status.success;
        notifyListeners();
      },
      onError: (_) {
        status = Status.error;
        notifyListeners();
      },
    );
  }

  DateTime? _parseDate(String raw) {
    final t = raw.trim();
    if (t.isEmpty) return null;
    return DateTime.tryParse(t);
  }

  /// Estado interno en BD; el usuario no lo elige en el formulario.
  static const String _internalStatus = 'registered';

  Future<void> createTournament({
    required String name,
    required String host,
    required String location,
    required String dateStart,
    required String dateEnd,
    required String discipline,
  }) async {
    try {
      status = Status.loading;
      notifyListeners();

      final ds = _parseDate(dateStart);
      final de = _parseDate(dateEnd);
      if (ds == null || de == null) {
        status = Status.error;
        message = 'Fechas inválidas. Use formato AAAA-MM-DD.';
        notifyListeners();
        return;
      }

      await create(
        TournamentEntity(
          id: null,
          name: name.trim(),
          host: host.trim(),
          location: location.trim(),
          dateStart: ds,
          dateEnd: de,
          status: _internalStatus,
          discipline: discipline.trim(),
          setupPhase: TournamentLifecycle.created,
        ),
      );

      status = Status.success;
      message = 'Torneo creado correctamente';
    } catch (e) {
      status = Status.error;
      message = 'No se pudo crear el torneo: ${e.toString()}';
    }

    notifyListeners();
  }

  Future<void> updateTournament({
    required int id,
    String? name,
    String? host,
    String? location,
    String? dateStart,
    String? dateEnd,
    String? discipline,
  }) async {
    try {
      status = Status.loading;
      notifyListeners();

      DateTime? ds;
      DateTime? de;
      if (dateStart != null) {
        ds = _parseDate(dateStart);
        if (ds == null) {
          status = Status.error;
          message = 'Fecha de inicio inválida. Use formato AAAA-MM-DD.';
          notifyListeners();
          return;
        }
      }
      if (dateEnd != null) {
        de = _parseDate(dateEnd);
        if (de == null) {
          status = Status.error;
          message = 'Fecha de fin inválida. Use formato AAAA-MM-DD.';
          notifyListeners();
          return;
        }
      }

      await update(
        id,
        name: name?.trim(),
        host: host?.trim(),
        location: location?.trim(),
        dateStart: ds,
        dateEnd: de,
        discipline: discipline?.trim(),
      );

      status = Status.success;
      message = 'Torneo actualizado correctamente';
    } catch (e) {
      status = Status.error;
      message = 'No se pudo actualizar el torneo: ${e.toString()}';
    }

    notifyListeners();
  }

  Future<void> deleteTournament(int id) async {
    try {
      status = Status.loading;
      notifyListeners();

      await delete(id);

      status = Status.success;
      message = 'Torneo eliminado correctamente';
    } catch (e) {
      status = Status.error;
      message = 'No se pudo eliminar el torneo: ${e.toString()}';
    }

    notifyListeners();
  }

  /// Cuando conectes DAOs de reglas/grupos, pasa los flags reales desde la UI.
  Future<void> startTournament(
    int id, {
    bool hasCombatSettings = false,
    bool hasGroupsDefined = false,
  }) async {
    try {
      status = Status.loading;
      notifyListeners();

      await startTournamentUseCase(
        id,
        hasCombatSettings: hasCombatSettings,
        hasGroupsDefined: hasGroupsDefined,
      );

      status = Status.success;
      message = 'Torneo iniciado';
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }

    notifyListeners();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void clearMessages() {
    status = Status.idle;
    message = null;
  }
}
