import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:tkd_score/data/tables/users.dart';
import 'package:tkd_score/data/tables/headquarters.dart';
import 'package:tkd_score/data/tables/sogis.dart';
import 'package:tkd_score/data/tables/belts.dart';
import 'package:tkd_score/data/tables/students.dart';
import 'package:tkd_score/data/tables/tournament.dart';
import 'package:tkd_score/data/tables/judge.dart';
import 'package:tkd_score/data/tables/group.dart';
import '../../../core/constants/database.dart';
import 'package:tkd_score/data/tables/inscription.dart';
import 'package:tkd_score/data/tables/versus.dart';
import 'package:tkd_score/data/tables/score.dart';
import 'package:tkd_score/data/tables/winner.dart';

part 'database.g.dart'; // se generará automáticamente

@DriftDatabase(
  tables: [
    Headquarters,
    Users,
    Sogis,
    Belts,
    SogiBelts,
    Students,
    Tournament,
    Judge,
    JudgeTournament,
    Group,
    Inscription,
    Versus,
    Score,
    Winner,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => DatabaseConstants.databaseVersion;

  // Opcional: puedes agregar métodos de utilidad
  Future<void> printDatabasePath() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, DatabaseConstants.databaseName);
    print('🗄️ DB REAL PATH: $path');
  }
}

// Función para abrir la conexión (equivalente a _openDb)
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Obtener la ruta del directorio de soporte
    // la ruta para encontrar la bd es: C:\Users\user\AppData\Roaming\com.example\tkd_score
    final dir = await getApplicationSupportDirectory();
    final path = p.join(dir.path, DatabaseConstants.databaseName);

    print('🗄️ DB REAL PATH: $path'); // verificar donde guarda la db

    // Crear el archivo de la base de datos
    return NativeDatabase(File(path));
  });
}
