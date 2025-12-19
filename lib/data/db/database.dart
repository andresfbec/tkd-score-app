import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'tables.dart';

class DatabaseConnection {
  static Database? _db;

  static Future<Database> _openDb() async {
    if (_db == null) {
      final databasePath = await databaseFactoryFfi.getDatabasesPath();
      final path = join(databasePath, 'tkd_.db');

      _db = await databaseFactoryFfi.openDatabase(
        path,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            for (final table in dbTables) {
              print("Ejecutando SQL: $table");
              try {
                await db.execute(table);
              } catch (e) {
                print("❌ ERROR ejecutando la tabla:");
                print(table);
                print("Error: $e");
              }
            }
          },
        ),
      );
    }

    return _db!;
  }

  static Future<Database> getDatabase() async {
    return _openDb();
  }
}
