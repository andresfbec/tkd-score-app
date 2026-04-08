import '../../core/config/db/database.dart';

// esto es para los campos adicionales de los joins a nivel sql necesarios en la ui 
class StudentWithInfo {
  final Student student;
  final Headquarter? headquarter;
  final Belt? belt;

  StudentWithInfo({required this.student, this.headquarter, this.belt});
}
