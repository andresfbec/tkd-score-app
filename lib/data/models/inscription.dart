import 'package:equatable/equatable.dart';
import 'students.dart';
import 'tournament.dart';
import 'grub.dart';

class Inscription extends Equatable {
  final int id;
  final DateTime dateStart;
  final Student student;
  final Tournament tournament;
  final Grub grub;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const Inscription({
    required this.id,
    required this.dateStart,
    required this.student,
    required this.tournament,
    required this.grub,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory Inscription.fromJson(Map<String, dynamic> json) {
    return Inscription(
      id: json['id'] as int,
      dateStart: DateTime.parse(json['date_start'] as String),
      student: Student.fromJson(
        json['student'] as Map<String, dynamic>,
      ),
      tournament: Tournament.fromJson(
        json['tournament'] as Map<String, dynamic>,
      ),
      grub: Grub.fromJson(
        json['grub'] as Map<String, dynamic>,
      ),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      synchronized: json['synchronized'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date_start': dateStart.toIso8601String(),
      'student': student.toJson(),
      'tournament': tournament.toJson(),
      'grub': grub.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  Inscription copyWith({
    int? id,
    DateTime? dateStart,
    Student? student,
    Tournament? tournament,
    Grub? grub,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return Inscription(
      id: id ?? this.id,
      dateStart: dateStart ?? this.dateStart,
      student: student ?? this.student,
      tournament: tournament ?? this.tournament,
      grub: grub ?? this.grub,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [
        id,
        dateStart,
        student,
        tournament,
        grub,
        createdAt,
        updatedAt,
        synchronized
      ];
}
