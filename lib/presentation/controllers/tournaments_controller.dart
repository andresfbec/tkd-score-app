import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/entities/tournament_entity.dart';
import '../../domain/usecases/tournament/create_tournament.dart';
import '../../domain/usecases/tournament/update_tournament.dart';
import '../../domain/usecases/tournament/delete_tournament.dart';
import '../../domain/usecases/tournament/find_tournaments.dart';
import '../../domain/usecases/tournament/watch_tournaments.dart';

import '../../core/enums/status.dart';

class TournamentsController extends ChangeNotifier {
  final CreateTournament create;
  final UpdateTournament update;
  final DeleteTournament delete;
  final FindTournaments find;
  final WatchTournaments watch;

  TournamentsController(
    this.create,
    this.update,
    this.delete,
    this.find,
    this.watch,
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
      return t.name.toLowerCase().contains(q) ||
          t.location.toLowerCase().contains(q) ||
          t.host.toLowerCase().contains(q) ||
          t.status.toLowerCase().contains(q);
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

  Future<void> createTournament({
    required String name,
    required String host,
    required String location,
    required String dateStart,
    required String dateEnd,
    required String tournamentStatus,
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
          status: tournamentStatus.trim(),
          discipline: discipline.trim(),
          setupPhase: 'draft',
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
    String? tournamentStatus,
    String? discipline,
    String? setupPhase,
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
        status: tournamentStatus?.trim(),
        discipline: discipline?.trim(),
        setupPhase: setupPhase?.trim(),
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
