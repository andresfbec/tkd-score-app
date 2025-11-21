import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar FFI para escritorio
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final db = await openDatabase(
    join(await databaseFactory.getDatabasesPath(), 'test.db'),
    onCreate: (db, version) async {
      await db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT)');
    },
    version: 1,
  );

  await db.insert('dogs', {'id': 1, 'name': 'Firulais'});
  final result = await db.query('dogs');
  print(result); // debería mostrar [{id: 1, name: Firulais}]

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text('SQFLite FFI funcionando ✅')),
      ),
    );
  }
}
