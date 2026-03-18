import 'package:equatable/equatable.dart';

class StudentsEntity extends Equatable {
  final int? id;
  final String names;
  final String surnames;
  final String typeDocument;
  final String documentNumber;
  final int age;
  final String gender;
  final double weight;
  final double size;
  final int headquarterId;
  final int beltsId;

  const StudentsEntity({
    required this.id,
    required this.names,
    required this.surnames,
    required this.typeDocument,
    required this.documentNumber,
    required this.age,
    required this.gender,
    required this.weight,
    required this.size,
    required this.headquarterId,
    required this.beltsId,
  });

  @override
  List<Object?> get props => [
    id,
    names,
    surnames,
    typeDocument,
    documentNumber,
    age,
    gender,
    weight,
    size,
    headquarterId,
    beltsId,
  ];
}
