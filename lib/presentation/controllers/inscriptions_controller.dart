import 'package:flutter/material.dart';
import '../../core/enums/status.dart';
import '../../domain/entities/inscriptions_entity.dart';
import '../../domain/usecases/inscriptions/create_inscription.dart';
import '../../domain/usecases/inscriptions/delete_inscription.dart';
import '../../domain/usecases/inscriptions/get_inscriptions_by_tournament.dart';
import '../../domain/usecases/tournament/sync_tournament_setup_phase.dart';

class InscriptionsController extends ChangeNotifier {
  final CreateInscription createUseCase;
  final DeleteInscription deleteUseCase;
  final GetInscriptionsByTournament getByTournamentUseCase;
  final SyncTournamentSetupPhase syncTournamentSetupPhaseUseCase;

  InscriptionsController({
    required this.createUseCase,
    required this.deleteUseCase,
    required this.getByTournamentUseCase,
    required this.syncTournamentSetupPhaseUseCase,
  });

  Status status = Status.idle;
  String? message;

  // IDs de estudiantes que el usuario ha seleccionado en la UI
  final Set<int> _selectedStudentIds = {};
  // Inscripciones que ya existen en la DB para este torneo
  List<InscriptionsEntity> _existingInscriptions = [];

  Set<int> get selectedStudentIds => _selectedStudentIds;
  List<InscriptionsEntity> get inscriptions => _existingInscriptions;
  bool get hasChanges => _checkIfChangesExist();

  /// Carga las inscripciones actuales del torneo para pre-seleccionar los checkboxes
  Future<void> loadInscriptions(int tournamentId) async {
    status = Status.loading;
    notifyListeners();

    try {
      _existingInscriptions = await getByTournamentUseCase(tournamentId);
      print('Inscripciones cargadas: ${_existingInscriptions}');
      _selectedStudentIds.clear();
      for (var ins in _existingInscriptions) {
        _selectedStudentIds.add(ins.studentId);
      }
      status = Status.success;
    } catch (e) {
      status = Status.error;
      message = e.toString();
    }
    notifyListeners();
  }

  /// Alterna la selección de un estudiante individual
  void toggleStudentSelection(int studentId) {
    if (_selectedStudentIds.contains(studentId)) {
      _selectedStudentIds.remove(studentId);
    } else {
      _selectedStudentIds.add(studentId);
    }
    notifyListeners();
  }

  /// Selección o deselección masiva para una sede completa
  void toggleSedeSelection(List<int> studentIdsInSede, bool select) {
    if (select) {
      _selectedStudentIds.addAll(studentIdsInSede);
    } else {
      for (var id in studentIdsInSede) {
        _selectedStudentIds.remove(id);
      }
    }
    notifyListeners();
  }

  /// Compara el Set actual con la DB y realiza las operaciones necesarias
  Future<void> syncInscriptions(int tournamentId) async {
    status = Status.loading;
    notifyListeners();

    try {
      // 1. Identificar quiénes hay que ELIMINAR (estaban en DB pero ya no en el Set)
      final toDelete = _existingInscriptions.where(
        (ins) => !_selectedStudentIds.contains(ins.studentId)
      ).toList();

      for (var ins in toDelete) {
        if (ins.id != null) await deleteUseCase(ins.id!);
      }

      // 2. Identificar quiénes hay que CREAR (están en el Set pero no estaban en DB)
      final existingStudentIds = _existingInscriptions.map((e) => e.studentId).toSet();
      final toCreate = _selectedStudentIds.where(
        (id) => !existingStudentIds.contains(id)
      ).toList();

      for (var studentId in toCreate) {
        await createUseCase(InscriptionsEntity(
          date: DateTime.now(),
          studentId: studentId,
          tournamentId: tournamentId,
        ));
      }

      message = "Inscripciones actualizadas correctamente";
      // Recargamos para refrescar la lista de 'existing'
      await loadInscriptions(tournamentId);
      // Sincronizar fase del torneo (puede que ahora esté listo para grupos o iniciar)
      await syncTournamentSetupPhaseUseCase(tournamentId);
    } catch (e) {
      status = Status.error;
      message = "Error al sincronizar: $e";
    }
    notifyListeners();
  }

  bool _checkIfChangesExist() {
    final existingIds = _existingInscriptions.map((e) => e.studentId).toSet();
    if (_selectedStudentIds.length != existingIds.length) return true;
    return !_selectedStudentIds.every((id) => existingIds.contains(id));
  }

  void clearMessages() {
    status = Status.idle;
    message = null;
    notifyListeners();
  }
}
