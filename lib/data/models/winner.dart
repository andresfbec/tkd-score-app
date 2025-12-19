import 'package:equatable/equatable.dart';
import 'inscription.dart';
import 'score.dart';

class Winner extends Equatable {
  final int id;
  final Inscription inscription;
  final Score score;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const Winner({
    required this.id,
    required this.inscription,
    required this.score,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory Winner.fromJson(Map<String, dynamic> json) {
    return Winner(
      id: json['id'] as int,
      inscription: Inscription.fromJson(
        json['inscription'] as Map<String, dynamic>,
      ),
      score: Score.fromJson(json['score'] as Map<String, dynamic>),
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
      'inscription': inscription.toJson(),
      'score': score.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  Winner copyWith({
    int? id,
    Inscription? inscription,
    Score? score,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return Winner(
      id: id ?? this.id,
      inscription: inscription ?? this.inscription,
      score: score ?? this.score,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [
    id,
    inscription,
    score,
    createdAt,
    updatedAt,
    synchronized,
  ];
}
