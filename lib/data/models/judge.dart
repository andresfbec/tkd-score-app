import 'package:equatable/equatable.dart';

class Judge extends Equatable {
  final int id;
  final String names;
  final String surnames;
  final String numberId;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const Judge({
    required this.id,
    required this.names,
    required this.surnames,
    required this.numberId,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory Judge.fromJson(Map<String, dynamic> json) {
    return Judge(
      id: json['id'] as int,
      names: json['names'] as String,
      surnames: json['surnames'] as String,
      numberId: json['number_id'] as String,
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
      'names': names,
      'surnames': surnames,
      'number_id': numberId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  Judge copyWith({
    int? id,
    String? names,
    String? surnames,
    String? numberId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return Judge(
      id: id ?? this.id,
      names: names ?? this.names,
      surnames: surnames ?? this.surnames,
      numberId: numberId ?? this.numberId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [
    id,
    names,
    surnames,
    numberId,
    createdAt,
    updatedAt,
    synchronized,
  ];
}
