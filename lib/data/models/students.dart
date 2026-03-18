import 'package:drift/drift.dart';
import 'headquarters.dart';
import 'belsts.dart';

class Students extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get names => text()();
  TextColumn get surnames => text()();
  TextColumn get typeIdentify => text()();
  TextColumn get identify => text()();
  IntColumn get age => integer()();
  TextColumn get gender => text()();
  RealColumn get weight => real()();
  RealColumn get size => real()();

  IntColumn get headquarterId => integer().references(
    Headquarters,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();
  IntColumn get beltId => integer().references(
    Belsts,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
