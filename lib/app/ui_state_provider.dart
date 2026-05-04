import 'package:flutter/material.dart';

class UIStateProvider extends ChangeNotifier {
  bool _showHeadquartersDetail = false;
  bool _showStudentsDetail = false;
  bool _showStudentsFilter = false;

  // Estado para almacenar el estudiante seleccionado y su fila original
  dynamic _selectedStudent;
  Map<String, dynamic>? _selectedStudentRow;

  // Estado para alamacenar la sede seleccionada y su fila original
  dynamic _selectedHeadquarter;
  Map<String, dynamic>? _selectedHeadquarterRow;

  bool get showHeadquartersDetail => _showHeadquartersDetail;
  bool get showStudentsDetail => _showStudentsDetail;
  bool get showStudentsFilter => _showStudentsFilter;

  // Getters para estudiante seleccionado
  dynamic get selectedStudent => _selectedStudent;
  Map<String, dynamic>? get selectedStudentRow => _selectedStudentRow;

  // Getters para sede seleccionada
  dynamic get selectedHeadquarter => _selectedHeadquarter;
  Map<String, dynamic>? get selectedHeadquarterRow => _selectedHeadquarterRow;

  void toggleHeadquartersDetail() {
    _showHeadquartersDetail = !_showHeadquartersDetail;
    notifyListeners();
  }

  void toggleStudentsDetail() {
    _showStudentsDetail = !_showStudentsDetail;
    notifyListeners();
  }

  void toggleStudentsFilter() {
    _showStudentsFilter = !_showStudentsFilter;
    notifyListeners();
  }

  // SELECTOR STUNDENT
  void selectStudent(dynamic student, Map<String, dynamic> row) {
    _selectedStudent = student; // Es el modelo limpio obtenido
    _selectedStudentRow = row; //  Es todo lo que viene en la fila de la tabla 
    notifyListeners();
  }

  void clearStudentSelection() {
    _selectedStudent = null;
    _selectedStudentRow = null;
    notifyListeners();
  } 
  // STUDENTS PAGE SELECTION  

  // SELECTOR HEADQUARTER
  void selectHeadquarter(dynamic hq, Map<String, dynamic> row) {
    _selectedHeadquarter = hq;
    _selectedHeadquarterRow = row;
    notifyListeners();
  }
}