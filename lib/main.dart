import 'package:fluent_ui/fluent_ui.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'data/db/database.dart';

void main() {
  // Initialize FFI No  Borrar esta linea
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Mi primera app',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> probarDB() async {
    final db = await DatabaseConnection.getDatabase();

    final tablas = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table'",
    );

    print("Tablas encontradas: $tablas");
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(title: Text('🥋 TKD Nexus')),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hola, bienvenido esta es primera pagina web construida en flutter',
          ),
          const Text('Este es un segundo texto por practicar'),
          const SizedBox(height: 20),
          TextBox(
            placeholder: 'Tu nombre aqui',
            onChanged: (valor) => print('el valor fue $valor'),
          ),
          const SizedBox(height: 20),
          Button(
            child: const Text('Imprime lo que escribiste'),
            onPressed: () => print('hola mundo'),
          ),
          Button(child: const Text('Probar DB'), onPressed: probarDB),
        ],
      ),
    );
  }
}
