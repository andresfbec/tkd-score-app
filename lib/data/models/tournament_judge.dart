import 'package:equatable/equatable.dart';
import 'tournament.dart';
import 'judge.dart';

class TournamentJudge extends Equatable {
  final int id;
  final Tournament tournament;
  final Judge judge;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const TournamentJudge({
    required this.id,
    required this.tournament,
    required this.judge,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory TournamentJudge.fromJson(Map<String, dynamic> json) {
    return TournamentJudge(
      id: json['id'] as int,
      tournament: Tournament.fromJson(
        json['tournament'] as Map<String, dynamic>,
      ),
      judge: Judge.fromJson(
        json['judge'] as Map<String, dynamic>,
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
      'tournament': tournament.toJson(),
      'judge': judge.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  TournamentJudge copyWith({
    int? id,
    Tournament? tournament,
    Judge? judge,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return TournamentJudge(
      id: id ?? this.id,
      tournament: tournament ?? this.tournament,
      judge: judge ?? this.judge,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [
        id,
        tournament,
        judge,
        createdAt,
        updatedAt,
        synchronized,
      ];
}
