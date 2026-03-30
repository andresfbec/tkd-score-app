// En este archivo definimos la instancia definitiva que van a usar todas las dependecias
import 'database.dart';

class AppDatabaseProvider {
  AppDatabaseProvider._(); // constructor privado

  static final AppDatabase _instance = AppDatabase();

  static AppDatabase get instance =>
      _instance; // UNA sola instancia para evitar instancias multiples

  static Future<void> close() async { // para cerrar la base de datos 
    await _instance.close();
  }
}
