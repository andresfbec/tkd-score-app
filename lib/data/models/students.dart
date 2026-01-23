import 'package:equatable/equatable.dart';
import 'headquarters.dart';
import 'belts.dart';

class Student extends Equatable {
  final int id;
  final String names;
  final String surnames;
  final String typeidentifycation;
  final String identification;
  final String age;
  final String gender;
  final int weight;
  final int height;
  final int size;
  // final Headquarters headquarters;
  final Belts belts;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const Student({
    required this.id,
    required this.names,
    required this.surnames,
    required this.typeidentifycation,
    required this.identification,
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    required this.size,
    // required this.headquarters,
    required this.belts,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as int,
      names: json['names'] as String,
      surnames: json['surnames'] as String,
      typeidentifycation: json['type_identifycation'] as String,
      identification: json['identification'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
      weight: json['weight'] as int,
      height: json['height'] as int,
      size: json['size'] as int,
      // headquarters: Headquarters.fromJson(
      //   json['headquarters'] as Map<String, dynamic>,
      // ),
      belts: Belts.fromJson(json['belts'] as Map<String, dynamic>),
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
      'type_identifycation': typeidentifycation,
      'identification': identification,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'size': size,
      // 'headquarters': headquarters.toJson(),
      'belts': belts.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  Student copyWith({
    int? id,
    String? names,
    String? surnames,
    String? typeidentifycation,
    String? identification,
    String? age,
    String? gender,
    int? weight,
    int? height,
    int? size,
    // Headquarters? headquarters,
    Belts? belts,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return Student(
      id: id ?? this.id,
      names: names ?? this.names,
      surnames: surnames ?? this.surnames,
      typeidentifycation: typeidentifycation ?? this.typeidentifycation,
      identification: identification ?? this.identification,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      size: size ?? this.size,
      // headquarters: headquarters ?? this.headquarters,
      belts: belts ?? this.belts,
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
    typeidentifycation,
    identification,
    age,
    gender,
    weight,
    height,
    size,
    // headquarters,
    belts,
    createdAt,
    updatedAt,
    synchronized,
  ];
}
