import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/entities/combat_events_entity.dart';
import '../../domain/usecases/combat_events/create_combat_event.dart';
import '../../domain/usecases/combat_events/create_batch_combat_events.dart';
import '../../domain/usecases/combat_events/update_combat_event.dart';
import '../../domain/usecases/combat_events/delete_combat_event.dart';
import '../../domain/usecases/combat_events/get_combat_event_by_id.dart';
import '../../domain/usecases/combat_events/get_combat_events_by_round_id.dart';
import '../../domain/usecases/combat_events/watch_combat_events_by_round_id.dart';
import '../../domain/usecases/combat_events/invalidate_combat_event.dart';
import '../../domain/usecases/combat_events/insert_combat_event_correction.dart';
import '../../domain/usecases/combat_events/calculate_round_points.dart';
import '../../domain/usecases/combat_events/delete_all_combat_events_by_round.dart';

import '../../core/enums/status.dart';

class CombatEventsController extends ChangeNotifier {
  final CreateCombatEvent createUseCase;
  final CreateBatchCombatEvents createBatchUseCase;
  final UpdateCombatEvent updateUseCase;
  final DeleteCombatEvent deleteUseCase;
  final GetCombatEventById getByIdUseCase;
  final GetCombatEventsByRoundId getByRoundIdUseCase;
  final WatchCombatEventsByRoundId watchByRoundIdUseCase;
  final InvalidateCombatEvent invalidateUseCase;
  final InsertCombatEventCorrection insertCorrectionUseCase;
  final CalculateRoundPoints calculatePointsUseCase;
  final DeleteAllCombatEventsByRound deleteAllByRoundUseCase;

  CombatEventsController({
    required this.createUseCase,
    required this.createBatchUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
    required this.getByIdUseCase,
    required this.getByRoundIdUseCase,
    required this.watchByRoundIdUseCase,
    required this.invalidateUseCase,
    required this.insertCorrectionUseCase,
    required this.calculatePointsUseCase,
    required this.deleteAllByRoundUseCase,
  });

  List<CombatEventsEntity> _events = [];
  Status status = Status.idle;
  String? message;

  StreamSubscription<List<CombatEventsEntity>>? _subscription;

  List<CombatEventsEntity> get events => _events;

  void startListening(int roundId) {
    status = Status.loading;
    notifyListeners();

    _subscription?.cancel();
    _subscription = watchByRoundIdUseCase(roundId).listen(
      (data) {
        _events = data;
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

  Future<void> addEvent(CombatEventsEntity event) async {
    try {
      status = Status.loading;
      notifyListeners();
      await createUseCase(event);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> addBatchEvents(List<CombatEventsEntity> events) async {
    try {
      status = Status.loading;
      notifyListeners();
      await createBatchUseCase(events);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> updateEvent(CombatEventsEntity event) async {
    try {
      status = Status.loading;
      notifyListeners();
      await updateUseCase(event);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> deleteEvent(int id) async {
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

  Future<void> invalidateEvent(int eventId, {required String reason}) async {
    try {
      status = Status.loading;
      notifyListeners();
      await invalidateUseCase(eventId, reason: reason);
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> insertCorrection({
    required int roundId,
    required String pointType,
    required String targetParticipant,
    required double pointsDelta,
    double? matchSeconds,
    int? registeredByJudgeId,
    required int replacesEventId,
  }) async {
    try {
      status = Status.loading;
      notifyListeners();
      await insertCorrectionUseCase(
        roundId: roundId,
        pointType: pointType,
        targetParticipant: targetParticipant,
        pointsDelta: pointsDelta,
        matchSeconds: matchSeconds,
        registeredByJudgeId: registeredByJudgeId,
        replacesEventId: replacesEventId,
      );
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<Map<String, double>> calculatePoints(int roundId) async {
    return await calculatePointsUseCase(roundId);
  }

  Future<void> deleteAllByRound(int roundId) async {
    try {
      status = Status.loading;
      notifyListeners();
      await deleteAllByRoundUseCase(roundId);
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
