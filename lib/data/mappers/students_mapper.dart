import '../../domain/entities/students_entity.dart';

class StudentsMapper {
  static StudentsEntity fromMap(Map<String, dynamic> map) {
    return StudentsEntity(
      id: map['id'] as int,
      names: map['name'] as String,
      surnames: map['surname'] as String,
      typeDocument: map['type_identify'] as String,
      documentNumber: map['number_id'] as String,
      age: map['age'] as int,
      gender: map['gender'] as String,
      weight: map['weight'] as double,
      size: map['size'] as double,
      headquarterId: map['headquarterId'] as int,
      beltsId: map['belt'] as int,
    );
  }
}
