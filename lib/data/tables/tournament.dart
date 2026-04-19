import 'package:drift/drift.dart';

/// Torneo: se crea primero; la configuración de combate vive en [CombatSettings]
/// con FK `tournament_id` (1:1).
///
/// [setupPhase] — flujo operativo sugerido:
/// - draft: creado, aún sin [CombatSettings]
/// - settings_ready: reglas de combate guardadas
/// - groups_ready: grupos definidos e inscripciones cerradas por grupo
/// - ready_to_start: listo para generar llaves / “iniciar” torneo
/// - live: en ejecución
/// - finished: finalizado
class Tournament extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get host => text().withDefault(const Constant(''))();
  TextColumn get location => text()();
  DateTimeColumn get dateStart => dateTime()();
  DateTimeColumn get dateEnd => dateTime()();
  TextColumn get status => text()();
  TextColumn get discipline => text().withDefault(const Constant('combat'))();
  TextColumn get setupPhase => text().withDefault(const Constant('draft'))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
