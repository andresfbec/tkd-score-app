import 'package:equatable/equatable.dart';

class InscriptionsEntity extends Equatable {
  final int? id;
  final DateTime date;
  final int studentId;
  final int tournamentId;
  final int? groupId;

  // Campos de joins (opcionales para mostrar en la UI)
  final String? studentNames;
  final String? studentSurnames;
  final String? tournamentName;
  final String? groupName;
  final double? studentWeight;
  final DateTime? studentBirthDate;
  final String? studentBeltName;

  const InscriptionsEntity({
    this.id,
    required this.date,
    required this.studentId,
    required this.tournamentId,
    this.groupId,
    this.studentNames,
    this.studentSurnames,
    this.tournamentName,
    this.groupName,
    this.studentWeight,
    this.studentBirthDate,
    this.studentBeltName,
  });

  InscriptionsEntity copyWith({
    int? id,
    DateTime? date,
    int? studentId,
    int? tournamentId,
    int? groupId,
    String? studentNames,
    String? studentSurnames,
    String? tournamentName,
    String? groupName,
    double? studentWeight,
    DateTime? studentBirthDate,
    String? studentBeltName,
  }) {
    return InscriptionsEntity(
      id: id ?? this.id,
      date: date ?? this.date,
      studentId: studentId ?? this.studentId,
      tournamentId: tournamentId ?? this.tournamentId,
      groupId: groupId ?? this.groupId,
      studentNames: studentNames ?? this.studentNames,
      studentSurnames: studentSurnames ?? this.studentSurnames,
      tournamentName: tournamentName ?? this.tournamentName,
      groupName: groupName ?? this.groupName,
      studentWeight: studentWeight ?? this.studentWeight,
      studentBirthDate: studentBirthDate ?? this.studentBirthDate,
      studentBeltName: studentBeltName ?? this.studentBeltName,
    );
  }

  @override
  List<Object?> get props => [
        id,
        date,
        studentId,
        tournamentId,
        groupId,
        studentNames,
        studentSurnames,
        tournamentName,
        groupName,
        studentWeight,
        studentBirthDate,
        studentBeltName,
      ];
}
