import 'package:drift/drift.dart';
import 'sogis.dart';

class Belts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}

class SogiBelts extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get sogiId => integer().references(
    Sogis,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();
  IntColumn get beltsId => integer().references(
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
