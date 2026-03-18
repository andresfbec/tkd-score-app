import 'package:flutter/material.dart';

class StudentMock {
  final String fullName;
  final int age;
  final String idNumber;
  final Color leftBelt;
  final Color rightBelt;

  StudentMock({
    required this.fullName,
    required this.age,
    required this.idNumber,
    required this.leftBelt,
    required this.rightBelt,
  });
}

// Lista de datos harcodeados para pruebas
final List<StudentMock> mockStudents = [
  StudentMock(
    fullName: "Andres Becerra",
    age: 19,
    idNumber: "1028483682",
    leftBelt: Colors.white,
    rightBelt: Colors.white, // blanco
  ),
  StudentMock(
    fullName: "Isabella Gomez",
    age: 22,
    idNumber: "1015443221",
    leftBelt: Colors.white,
    rightBelt: Colors.yellow, // Punta amarilla
  ),
  StudentMock(
    fullName: "Jhon Mendez",
    age: 15,
    idNumber: "1254585474",
    leftBelt: Colors.yellow,
    rightBelt: Colors.yellow, // Ramarillo
  ),
  StudentMock(
    fullName: "Carlos Ruiz",
    age: 15,
    idNumber: "1030998774",
    leftBelt: Colors.yellow,
    rightBelt: Colors.green, // punta verde
  ),
  StudentMock(
    fullName: "Estiven Bolaños",
    age: 15,
    idNumber: "1030998774",
    leftBelt: Colors.green,
    rightBelt: Colors.green, // verde
  ),
  StudentMock(
    fullName: "Federick Duarte",
    age: 15,
    idNumber: "1030998774",
    leftBelt: Colors.green,
    rightBelt: Colors.blueAccent, // punta azul
  ),
  StudentMock(
    fullName: "Juan Mendez",
    age: 15,
    idNumber: "1030998774",
    leftBelt: Colors.blueAccent,
    rightBelt: Colors.blueAccent, // azul
  ),
  StudentMock(
    fullName: "Mariana Torres",
    age: 25,
    idNumber: "52887441",
    leftBelt: Colors.blueAccent,
    rightBelt: Colors.red, // punta roja
  ),
  StudentMock(
    fullName: "Brock Lesnar",
    age: 25,
    idNumber: "52887441",
    leftBelt: Colors.red,
    rightBelt: Colors.red, // roja
  ),
  StudentMock(
    fullName: "Juan Pablo Duarte",
    age: 12,
    idNumber: "1044556332",
    leftBelt: Colors.red,
    rightBelt: Colors.black, // Punta negra
  ),
  StudentMock(
    fullName: "Lucas Paqueta Gomez",
    age: 12,
    idNumber: "1044556332",
    leftBelt: Colors.black,
    rightBelt: Colors.black, // negro
  ),
];