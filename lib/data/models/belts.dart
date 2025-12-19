import 'package:equatable/equatable.dart';

class Belts extends Equatable {
  final int id;
  final String name;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const Belts({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory Belts.fromJson(Map<String, dynamic> json) {
    return Belts(
      id: json['id'] as int,
      name: json['name'] as String,
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
      'name': name,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  Belts copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return Belts(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt, synchronized];
}
