import 'package:drift/drift.dart';
import '../../core/config/db/database.dart'; // Importa tu AppDatabase para acceder a los Companions

class InitialData {
  static List<BeltsCompanion> get initialBelts => [
    BeltsCompanion.insert(name: 'Blanco', primaryColor: 'white', secondaryColor: 'white'),
    BeltsCompanion.insert(name: 'Blanco Franja Amarilla', primaryColor: 'white', secondaryColor: 'yellow'),
    BeltsCompanion.insert(name: 'Amarillo', primaryColor: 'yellow', secondaryColor: 'yellow'),
    BeltsCompanion.insert(name: 'Amarillo Franja Verde', primaryColor: 'yellow', secondaryColor: 'green'),
    BeltsCompanion.insert(name: 'Verde', primaryColor: 'green', secondaryColor: 'green'),
    BeltsCompanion.insert(name: 'Verde Franja Azul', primaryColor: 'green', secondaryColor: 'blue'),
    BeltsCompanion.insert(name: 'Azul', primaryColor: 'blue', secondaryColor: 'blue'),
    BeltsCompanion.insert(name: 'Azul Franja Roja', primaryColor: 'blue', secondaryColor: 'red'),
    BeltsCompanion.insert(name: 'Rojo', primaryColor: 'red', secondaryColor: 'red'),
    BeltsCompanion.insert(name: 'Rojo Franja Negra', primaryColor: 'red', secondaryColor: 'black'),
    BeltsCompanion.insert(name: 'Negro', primaryColor: 'black', secondaryColor: 'black'),
  ];

  static List<PointTypesCompanion> get initialPointTypes => [
    const PointTypesCompanion(
      id: Value(1),
      name: Value('Puño al Peto'),
      pointsValue: Value(1),
      bodyZone: Value('TRUNK'),
      techniqueType: Value('PUNCH'),
      isPenalty: Value(false),
    ),
    const PointTypesCompanion(
      id: Value(2),
      name: Value('Patada Directa al Peto'),
      pointsValue: Value(2),
      bodyZone: Value('TRUNK'),
      techniqueType: Value('REGULAR_KICK'),
      isPenalty: Value(false),
    ),
    const PointTypesCompanion(
      id: Value(3),
      name: Value('Patada Directa a la Cabeza'),
      pointsValue: Value(3),
      bodyZone: Value('HEAD'),
      techniqueType: Value('REGULAR_KICK'),
      isPenalty: Value(false),
    ),
    const PointTypesCompanion(
      id: Value(4),
      name: Value('Patada con Giro al Peto'),
      pointsValue: Value(4),
      bodyZone: Value('TRUNK'),
      techniqueType: Value('SPINNING_KICK'),
      isPenalty: Value(false),
    ),
    const PointTypesCompanion(
      id: Value(5),
      name: Value('Patada con Giro a la Cabeza'),
      pointsValue: Value(5),
      bodyZone: Value('HEAD'),
      techniqueType: Value('SPINNING_KICK'),
      isPenalty: Value(false),
    ),
    const PointTypesCompanion(
      id: Value(6),
      name: Value('Gam-jeom (Penalización)'),
      pointsValue: Value(1),
      bodyZone: Value('NONE'),
      techniqueType: Value('PENALTY'),
      isPenalty: Value(true),
    ),
  ];
}