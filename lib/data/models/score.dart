import 'package:equatable/equatable.dart';
import 'package:tkd_score/data/models/versus.dart';
import 'judge.dart';
import 'sogi.dart';

class Score extends Equatable {
  final int id;
  final double score1;
  final double score2;
  final Judge judge;
  final Versus versus;
  final Sogi sogi1;
  final Sogi sogi2;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const Score({
    required this.id,
    required this.score1,
    required this.score2,
    required this.judge,
    required this.versus,
    required this.sogi1,
    required this.sogi2,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      id: json['id'] as int,
      score1: (json['score1'] as num).toDouble(),
      score2: (json['score2'] as num).toDouble(),
      judge: Judge.fromJson(
        json['judge'] as Map<String, dynamic>,
      ),
      versus: Versus.fromJson(
        json['versus'] as Map<String, dynamic>,
      ),
      sogi1: Sogi.fromJson(
        json['sogi1'] as Map<String, dynamic>,
      ),
      sogi2: Sogi.fromJson(
        json['sogi2'] as Map<String, dynamic>,
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
      'score1': score1,
      'score2': score2,
      'judge': judge.toJson(),
      'versus': versus.toJson(),
      'sogi1': sogi1.toJson(),
      'sogi2': sogi2.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  Score copyWith({
    int? id,
    double? score1,
    double? score2,
    Judge? judge,
    Versus? versus,
    Sogi? sogi1,
    Sogi? sogi2,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return Score(
      id: id ?? this.id,
      score1: score1 ?? this.score1,
      score2: score2 ?? this.score2,
      judge: judge ?? this.judge,
      versus: versus ?? this.versus,
      sogi1: sogi1 ?? this.sogi1,
      sogi2: sogi2 ?? this.sogi2,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [
        id,
        score1,
        score2,
        judge,
        versus,
        sogi1,
        sogi2,
        createdAt,
        updatedAt,
        synchronized,
      ];
}
