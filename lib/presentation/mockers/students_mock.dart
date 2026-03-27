import 'package:flutter/material.dart';

class StudentMock {
  final int id;
  final String names;
  final String surnames;
  final String typeIdentify;
  final String numberId;
  final int age;
  final String gender;
  final double weight;
  final double height;
  final int headquarterId;
  final int beltId;

  /// 🔥 NUEVO
  final int participations; // torneos / participaciones

  StudentMock({
    required this.id,
    required this.names,
    required this.surnames,
    required this.typeIdentify,
    required this.numberId,
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    required this.headquarterId,
    required this.beltId,
    required this.participations,
  });

  // ======================
  // UI HELPERS
  // ======================

  String get fullName => "$names $surnames";

  String get initials =>
      "${names.isNotEmpty ? names[0] : ''}${surnames.isNotEmpty ? surnames[0] : ''}";

  Color get leftBelt => beltColorMap[beltId]!.$1;
  Color get rightBelt => beltColorMap[beltId]!.$2;

  // ======================
  // BACKEND READY
  // ======================

  factory StudentMock.fromJson(Map<String, dynamic> json) {
    return StudentMock(
      id: json['id'],
      names: json['names'],
      surnames: json['surnames'],
      typeIdentify: json['type_identify'],
      numberId: json['number_id'],
      age: json['age'],
      gender: json['gender'],
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      headquarterId: json['headquarter_id'],
      beltId: json['belt_id'],
      participations: json['participations'] ?? 0, // 🔥 importante
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'names': names,
      'surnames': surnames,
      'type_identify': typeIdentify,
      'number_id': numberId,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'headquarter_id': headquarterId,
      'belt_id': beltId,
      'participations': participations,
    };
  }
}


Map<int, (Color, Color)> beltColorMap = {
  1: (Colors.white, Colors.white),
  2: (Colors.white, Colors.yellow),
  3: (Colors.yellow, Colors.yellow),
  4: (Colors.yellow, Colors.green),
  5: (Colors.green, Colors.green),
  6: (Colors.green, Colors.blue),
  7: (Colors.blue, Colors.blue),
  8: (Colors.blue, Colors.red),
  9: (Colors.red, Colors.red),
  10: (Colors.red, Colors.black),
  11: (Colors.black, Colors.black),
};


final List<StudentMock> mockStudents = List.generate(4, (index) {
  final beltId = (index % 11) + 1;

  return StudentMock(
    id: index + 1,
    names: [
      "Juan",
      "Andres",
      "Camila",
      "Sofia",
      "Mateo",
      "Valentina",
      "Sebastian",
      "Daniela",
      "Luis",
      "Mariana"
    ][index % 10],
    surnames: [
      "Gomez",
      "Rodriguez",
      "Martinez",
      "Lopez",
      "Hernandez",
      "Perez",
      "Garcia",
      "Ramirez",
      "Torres",
      "Castro"
    ][index % 10],
    typeIdentify: "CC",
    numberId: "10${10000000 + index}",
    age: 12 + (index % 15),
    gender: index % 2 == 0 ? "Masculino" : "Femenino",
    weight: 40 + (index * 1.5),
    height: double.parse((1.40 + (index * 0.02)).toStringAsFixed(2)),
    headquarterId: (index % 3) + 1,
    beltId: beltId,

    /// 🔥 participaciones random tipo backend
    participations: (index * 3) % 10,
  );
});