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

  // Campos de joins
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

  // El método copyWith crea una instancia nueva con los valores actualizados
  StudentsEntity copyWith({
    int? id,
    String? names,
    String? surnames,
    String? typeIdentify,
    String? numberIdentify,
    String? gender,
    DateTime? birthDate,
    int? tournamentWins,
    int? participations,
    double? weightKg,
    double? heightCm,
    int? headquarterId,
    int? beltId,
    String? headquarterName,
    String? beltName,
    String? beltPrimaryColor,
    String? beltSecondaryColor,
  }) {
    return StudentsEntity(
      id: id ?? this.id,
      names: names ?? this.names,
      surnames: surnames ?? this.surnames,
      typeIdentify: typeIdentify ?? this.typeIdentify,
      numberIdentify: numberIdentify ?? this.numberIdentify,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      tournamentWins: tournamentWins ?? this.tournamentWins,
      participations: participations ?? this.participations,
      weightKg: weightKg ?? this.weightKg,
      heightCm: heightCm ?? this.heightCm,
      headquarterId: headquarterId ?? this.headquarterId,
      beltId: beltId ?? this.beltId,
      headquarterName: headquarterName ?? this.headquarterName,
      beltName: beltName ?? this.beltName,
      beltPrimaryColor: beltPrimaryColor ?? this.beltPrimaryColor,
      beltSecondaryColor: beltSecondaryColor ?? this.beltSecondaryColor,
    );
  }

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