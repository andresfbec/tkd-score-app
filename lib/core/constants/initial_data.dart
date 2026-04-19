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
}