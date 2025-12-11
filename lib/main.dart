import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'core/theme/theme_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


void main() { // start app

  // Inicializar SQLite FFI
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(), 
      child: const App()
    ),
  );
}
