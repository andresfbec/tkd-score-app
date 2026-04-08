import '../../entities/students_entity.dart';
import '../../repositories/students_repository.dart';

class WatchStudents {
  final StudentsRepository repository;

  WatchStudents(this.repository);

  // Usamos 'call' para que el Use Case se pueda ejecutar como una función
  Stream<List<StudentsEntity>> call({
    List<int>? hqIds,
    List<int>? beltIds,
    String? gender,
    int? minAge,
    int? maxAge,
    double? minWeight,
    double? maxWeight,
    bool? onlyActive,
  }) {
    return repository.watchStudents(
      hqIds: hqIds,
      beltIds: beltIds,
      gender: gender,
      minAge: minAge,
      maxAge: maxAge,
      minWeight: minWeight,
      maxWeight: maxWeight,
      onlyActive: onlyActive,
    );
  }
}