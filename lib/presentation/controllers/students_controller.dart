import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/entities/students_entity.dart';
import '../../domain/usecases/students/create_student.dart';
import '../../domain/usecases/students/update_student.dart';
import '../../domain/usecases/students/delete_student.dart';
import '../../domain/usecases/students/watch_students.dart';

import '../../core/enums/status.dart';

class StudentsController extends ChangeNotifier {
  final CreateStudent createUseCase;
  final UpdateStudent updateUseCase;
  final DeleteStudent deleteUseCase;
  final WatchStudents watchUseCase;

  StudentsController({
    required this.createUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
    required this.watchUseCase,
  });

  // ===============================
  // ESTADO (STATE)
  // ===============================
  List<StudentsEntity> _allStudents = [];
  Status status = Status.idle;
  String? message;
  String _searchQuery = "";

  StreamSubscription<List<StudentsEntity>>? _subscription;

  // ===============================
  // GETTERS
  // ===============================
  
  // Filtro de búsqueda local (por nombre o identificación)
  List<StudentsEntity> get filteredStudents {
    if (_searchQuery.isEmpty) return _allStudents;

    final query = _searchQuery.toLowerCase();
    return _allStudents.where((s) {
      return s.names.toLowerCase().contains(query) ||
          s.surnames.toLowerCase().contains(query) ||
          s.numberIdentify.contains(query);
    }).toList();
  }

  // ===============================
  // MÉTODOS DE FLUJO (STREAM)
  // ===============================

  // ===============================
  // MÉTODOS DE FLUJO (STREAM) - CORREGIDO
  // ===============================

  void startListening({
    List<int>? hqIds,
    List<int>? beltIds,
    String? gender,
    int? minAge,
    int? maxAge,
    double? minWeight,
    double? maxWeight,
    bool onlyActive = true,
  }) {
    status = Status.loading;
    notifyListeners();

    _subscription?.cancel(); // Cancelamos la suscripción anterior para no tener fugas de memoria
    
    _subscription = watchUseCase(
      hqIds: hqIds,
      beltIds: beltIds,
      gender: gender,
      minAge: minAge,
      maxAge: maxAge,
      minWeight: minWeight,
      maxWeight: maxWeight,
      onlyActive: onlyActive,
    ).listen(
      (data) {
        _allStudents = data;
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

  // ===============================
  // OPERACIONES CRUD
  // ===============================

  // CREATE
  Future<void> addStudent(StudentsEntity student) async {
    try {
      status = Status.loading;
      notifyListeners();

      await createUseCase(student);

      status = Status.success;
      message = "Estudiante registrado correctamente";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  // UPDATE
  Future<void> editStudent(StudentsEntity student) async {
    try {
      status = Status.loading;
      notifyListeners();

      await updateUseCase(student);

      status = Status.success;
      message = "Información actualizada correctamente";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
  }

  // DELETE
  Future<void> removeStudent(int id) async {
    try {
      status = Status.loading;
      notifyListeners();

      await deleteUseCase(id);

      status = Status.success;
      message = "Estudiante eliminado o inactivado con éxito";
    } catch (e) {
      status = Status.error;
      message = e.toString().replaceAll('Exception:', '').trim();
    }
    notifyListeners();
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
    super.dispose();
  }
}