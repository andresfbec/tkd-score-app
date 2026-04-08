import 'package:equatable/equatable.dart';

class StudentsEntity extends Equatable {
  final int? id;
  final String names;
  final String surnames;
  final String typeIdentify;
  final String numberIdentify;
  final String gender;
  final DateTime birthDate;
  final int tournamentWins;
  final int participations;
  final double weightKg;
  final double heightCm;
  final int headquarterId;
  final int beltId;

  // campos nuevos producto de los joins en la consulta
  final String? headquarterName;

  final String? beltName;
  final String? beltPrimaryColor;
  final String? beltSecondaryColor;


  const StudentsEntity({
    required this.id,
    required this.names,
    required this.surnames,
    required this.typeIdentify,
    required this.numberIdentify,
    required this.gender,
    required this.birthDate,
    required this.tournamentWins,
    required this.participations,
    required this.weightKg,
    required this.heightCm,
    required this.headquarterId,
    required this.beltId,

    this.headquarterName,
    this.beltName,
    this.beltPrimaryColor,
    this.beltSecondaryColor,
  });

  @override
  List<Object?> get props => [
    id,
    names,
    surnames,
    typeIdentify,
    numberIdentify,
    gender,
    birthDate,
    tournamentWins,
    participations,
    weightKg,
    heightCm,
    headquarterId,
    beltId,
    headquarterName,
    beltName,
    beltPrimaryColor,
    beltSecondaryColor,
  ];
}
