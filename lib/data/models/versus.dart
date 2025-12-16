import 'package:equatable/equatable.dart';
import 'package:tkd_score/data/models/inscription.dart';
import 'grub.dart';

class Versus extends Equatable {
  final int id;
  final Inscription inscription1;
  final Inscription inscription2;
  final Grub grub;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const Versus({
    required this.id,
    required this.inscription1,
    required this.inscription2,
    required this.grub,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory Versus.fromJson(Map<String, dynamic> json) {
    return Versus(
      id: json['id'] as int,
      inscription1: Inscription.fromJson(
        json['inscription1'] as Map<String, dynamic>,
      ),
      inscription2: Inscription.fromJson(
        json['inscription2'] as Map<String, dynamic>,
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
      'inscription1': inscription1.toJson(),
      'inscription2': inscription2.toJson(),
      'grub': grub.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  Versus copyWith({
    int? id,
    Inscription? inscription1,
    Inscription? inscription2,
    Grub? grub,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return Versus(
      id: id ?? this.id,
      inscription1: inscription1 ?? this.inscription1,
      inscription2: inscription2 ?? this.inscription2,
      grub: grub ?? this.grub,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [
        id,
        inscription1,
        inscription2,
        grub,
        createdAt,
        updatedAt,
        synchronized,
      ];
}
