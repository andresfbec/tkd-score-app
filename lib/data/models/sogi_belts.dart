import 'package:equatable/equatable.dart';
import 'sogi.dart';
import 'belts.dart';

class SogiBelts extends Equatable {
  final int id;
  final Sogi sogi;
  final Belts belts;
  final DateTime? updatedAt;
  final int synchronized;

  const SogiBelts({
    required this.id,
    required this.sogi,
    required this.belts,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory SogiBelts.fromJson(Map<String, dynamic> json) {
    return SogiBelts(
      id: json['id'] as int,
      sogi: Sogi.fromJson(json['sogi'] as Map<String, dynamic>),
      belts: Belts.fromJson(json['belts'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      synchronized: json['synchronized'] as int? ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sogi': sogi.toJson(),
      'belts': belts.toJson(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  SogiBelts copyWith({
    int? id,
    Sogi? sogi,
    Belts? belts,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return SogiBelts(
      id: id ?? this.id,
      sogi: sogi ?? this.sogi,
      belts: belts ?? this.belts,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [id, sogi, belts, updatedAt, synchronized];
}
