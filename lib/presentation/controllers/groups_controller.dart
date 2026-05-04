import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/entities/groups_entity.dart';
import '../../domain/usecases/groups/generate_standard_groups.dart';
import '../../domain/usecases/groups/auto_assign_inscriptions.dart';
import '../../domain/usecases/groups/watch_tournament_groups.dart';
import '../../domain/usecases/groups/delete_generated_groups.dart';
import '../../domain/usecases/groups/update_inscription_group.dart';
import '../../domain/usecases/groups/create_group.dart';
import '../../domain/usecases/groups/delete_group.dart';
import '../../domain/usecases/tournament/sync_tournament_setup_phase.dart';
import '../../core/enums/status.dart';

class GroupsController extends ChangeNotifier {
  final GenerateStandardGroups generateStandardGroupsUseCase;
  final AutoAssignInscriptions autoAssignInscriptionsUseCase;
  final WatchTournamentGroups watchTournamentGroupsUseCase;
  final DeleteGeneratedGroups deleteGeneratedGroupsUseCase;
  final UpdateInscriptionGroup updateInscriptionGroupUseCase;
  final CreateGroup createGroupUseCase;
  final DeleteGroup deleteGroupUseCase;
  final SyncTournamentSetupPhase syncTournamentSetupPhaseUseCase;

  GroupsController({
    required this.generateStandardGroupsUseCase,
    required this.autoAssignInscriptionsUseCase,
    required this.watchTournamentGroupsUseCase,
    required this.deleteGeneratedGroupsUseCase,
    required this.updateInscriptionGroupUseCase,
    required this.createGroupUseCase,
    required this.deleteGroupUseCase,
    required this.syncTournamentSetupPhaseUseCase,
  });

  // Estado
  List<GroupsEntity> _groups = [];
  Status status = Status.idle;
  String? message;
  StreamSubscription<List<GroupsEntity>>? _subscription;

  List<GroupsEntity> get groups => _groups;

  void loadGroups(int tournamentId) {
    status = Status.loading;
    notifyListeners();

    _subscription?.cancel();
    _subscription = watchTournamentGroupsUseCase(tournamentId).listen(
      (data) {
        _groups = data;
        status = Status.success;
        notifyListeners();
      },
      onError: (error) {
        status = Status.error;
        message = 'Error cargando grupos: $error';
        notifyListeners();
      },
    );
  }

  // Parámetros de granularidad con valores por defecto
  int _weightStepKg = 15;
  bool _mergeGenders = true;
  bool _mergeAges = false;

  int get weightStepKg => _weightStepKg;
  bool get mergeGenders => _mergeGenders;
  bool get mergeAges => _mergeAges;

  void setWeightStep(int step) {
    _weightStepKg = step;
    notifyListeners();
  }

  void setMergeGenders(bool value) {
    _mergeGenders = value;
    notifyListeners();
  }

  void setMergeAges(bool value) {
    _mergeAges = value;
    notifyListeners();
  }

  Future<void> generateGroups({
    required int tournamentId,
    required List<String> selectedAges,
    required List<String> selectedBelts,
  }) async {
    try {
      status = Status.loading;
      notifyListeners();

      await generateStandardGroupsUseCase(
        tournamentId: tournamentId,
        selectedAges: selectedAges,
        selectedBelts: selectedBelts,
        weightStepKg: _weightStepKg,
        mergeGenders: _mergeGenders,
        mergeAges: _mergeAges,
      );

      await syncTournamentSetupPhaseUseCase(tournamentId);

      status = Status.success;
      message = "Grupos generados exitosamente";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  Future<void> autoAssign(int tournamentId) async {
    try {
      status = Status.loading;
      notifyListeners();

      await autoAssignInscriptionsUseCase(tournamentId);

      await syncTournamentSetupPhaseUseCase(tournamentId);

      status = Status.success;
      message = "Inscripciones asignadas automáticamente";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  Future<void> deleteGroups(int tournamentId) async {
    try {
      status = Status.loading;
      notifyListeners();

      await deleteGeneratedGroupsUseCase(tournamentId);

      await syncTournamentSetupPhaseUseCase(tournamentId);

      status = Status.success;
      message = "Grupos eliminados";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  Future<void> createGroup(GroupsEntity group) async {
    status = Status.loading;
    notifyListeners();
    try {
      await createGroupUseCase(group);
      await syncTournamentSetupPhaseUseCase(group.tournamentId);
      status = Status.success;
      message = "Grupo creado exitosamente";
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> deleteGroup(int groupId) async {
    status = Status.loading;
    notifyListeners();
    try {
      await deleteGroupUseCase(groupId);
      // No tenemos el tournamentId directo aquí, tendríamos que buscar el grupo primero
      // o que el UI lo pase. Por ahora, si groups no está vacío, lo tomamos del primero.
      if (_groups.isNotEmpty) {
        await syncTournamentSetupPhaseUseCase(_groups.first.tournamentId);
      }
      status = Status.success;
      message = "Grupo eliminado";
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  Future<void> updateInscriptionGroup(int inscriptionId, int? groupId) async {
    try {
      await updateInscriptionGroupUseCase(inscriptionId, groupId);
      // Tras cambiar un grupo, sincronizamos la fase (por si era la última pendiente)
      // Necesitamos el tournamentId. Si no está, lo ideal sería que el método lo reciba.
      // Por ahora, si _groups no está vacío:
      if (_groups.isNotEmpty) {
        await syncTournamentSetupPhaseUseCase(_groups.first.tournamentId);
      }
    } catch (e) {
      status = Status.error;
      message = e.toString();
      notifyListeners();
    }
  }

  void clearMessages() {
    status = Status.idle;
    message = null;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
