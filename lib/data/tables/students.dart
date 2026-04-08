import 'package:drift/drift.dart';
import 'headquarters.dart';
import 'belts.dart';

class Students extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get names => text()();              // nombres
  TextColumn get surnames => text()();           // apellidos
  TextColumn get typeIdentify => text()();       // tipo de documento
  TextColumn get numberIdentify => text()();     // número de documento
  TextColumn get gender => text()();             // género

  DateTimeColumn get birthDate => dateTime()();  // fecha de nacimiento

  IntColumn get tournamentWins => integer().withDefault(const Constant(0))(); // torneos ganados
  IntColumn get participations => integer().withDefault(const Constant(0))(); // participaciones

  RealColumn get weightKg => real()();           // peso en kg
  RealColumn get heightCm => real()();           // altura en cm

  IntColumn get headquarterId => integer().references(
    Headquarters,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  IntColumn get beltId => integer().references(
    Belts,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
