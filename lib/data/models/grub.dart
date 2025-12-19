import 'package:equatable/equatable.dart';

class Grub extends Equatable {
  final int id;
  final String name;
  final String description;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const Grub({
    required this.id,
    required this.name,
    required this.description,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory Grub.fromJson(Map<String, dynamic> json) {
    return Grub(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
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
      'description': description,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  Grub copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return Grub(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        createdAt,
        updatedAt,
        synchronized,
      ];
}
