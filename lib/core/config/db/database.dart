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
import 'package:tkd_score/data/tables/groups.dart';
import 'package:tkd_score/data/tables/combat_settings.dart';
import 'package:tkd_score/data/tables/combat_rounds.dart';
import 'package:tkd_score/data/tables/combat_events.dart';
import '../../../core/constants/database.dart';
import 'package:tkd_score/data/tables/inscription.dart';
import 'package:tkd_score/data/tables/versus.dart';
import 'package:tkd_score/data/tables/score.dart';
import 'package:tkd_score/data/tables/winner.dart';

// cinturones iniciales (se insertan en la migración onCreate)
import '../../constants/initial_data.dart';

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
    CombatSettings,
    Judge,
    JudgeTournament,
    Groups,
    Inscription,
    Versus,
    CombatRounds,
    CombatEvents,
    Score,
    Winner,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => DatabaseConstants.databaseVersion;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();

      await batch((batch) {
        // Uso de lista externa
        batch.insertAll(belts, InitialData.initialBelts);
      });
    },
    onUpgrade: (m, from, to) async {
      if (from < 4) {
        await customStatement('PRAGMA foreign_keys = OFF');
        await m.deleteTable('combat_events');
        await m.deleteTable('combat_rounds');
        await m.deleteTable('winner');
        await m.deleteTable('score');
        await m.deleteTable('versus');
        await m.deleteTable('inscription');
        await m.deleteTable('groups');
        await m.deleteTable('combat_settings');
        await m.deleteTable('judge_tournament');
        await m.deleteTable('judge');
        await m.deleteTable('tournament');
        await m.deleteTable('sogi_belts');
        await m.deleteTable('sogis');
        await m.deleteTable('users');
        await m.deleteTable('students');
        await m.deleteTable('belts');
        await m.deleteTable('headquarters');
        await customStatement('PRAGMA foreign_keys = ON');

        await m.createAll();
        await batch((batch) {
          batch.insertAll(belts, InitialData.initialBelts);
        });
      }
    },
  );

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
