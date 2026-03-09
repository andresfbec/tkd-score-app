import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:tkd_score/data/models/users.dart';
import 'package:tkd_score/data/models/headquarters.dart';
import 'package:tkd_score/data/models/sogis.dart';
import 'package:tkd_score/data/models/belsts.dart';
import 'package:tkd_score/data/models/students.dart';
import 'package:tkd_score/data/models/tournament.dart';
import 'package:tkd_score/data/models/judge.dart';
import 'package:tkd_score/data/models/grup.dart';
import '../../../core/constants/database.dart';
import 'package:tkd_score/data/models/inscription.dart';
import 'package:tkd_score/data/models/versus.dart';
import 'package:tkd_score/data/models/score.dart';
import 'package:tkd_score/data/models/winner.dart';

part 'database.g.dart'; // se generará automáticamente

@DriftDatabase(
  tables: [
    Headquarters,
    Users,
    Sogis,
    Belsts,
    SogiBelts,
    Students,
    Tournament,
    Judge,
    JudgeTournament,
    Grup,
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
    // Obtener la ruta del directorio de documentos
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, DatabaseConstants.databaseName);

    print('🗄️ DB REAL PATH: $path'); // verificar donde guarda la db

    // Crear el archivo de la base de datos
    return NativeDatabase(File(path));
  });
}
