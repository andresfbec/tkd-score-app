import 'package:flutter/material.dart';

// clase de modelo para simular la representacion de un estudiante
class StudentMock {
  final int id;
  final String names;
  final String surnames;
  final String typeIdentify;
  final String numberId;
  final int age;
  final String gender;
  final double weight;
  final double size;
  final int headquarterId;
  final int beltId;

  /// UI helpers (para no perder tu diseño actual)
  final Color leftBelt;
  final Color rightBelt;

  StudentMock({
    required this.id,
    required this.names,
    required this.surnames,
    required this.typeIdentify,
    required this.numberId,
    required this.age,
    required this.gender,
    required this.weight,
    required this.size,
    required this.headquarterId,
    required this.beltId,
    required this.leftBelt,
    required this.rightBelt,
  });

  /// 🔥 útil para UI
  String get fullName => "$names $surnames";
}

// helper de los colores de los cinturones
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

final List<StudentMock> mockStudents = List.generate(20, (index) {
  final beltId = (index % 11) + 1;
  final belt = beltColorMap[beltId]!;

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
    gender: index % 2 == 0 ? "M" : "F",
    weight: 40 + (index * 1.5),
    size: 1.40 + (index * 0.02),
    headquarterId: (index % 3) + 1,
    beltId: beltId,
    leftBelt: belt.$1,
    rightBelt: belt.$2,
  );
});