import 'package:drift/drift.dart';
import 'group.dart';
import 'tournament.dart';
import 'students.dart';

class Inscription extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();

  IntColumn get studentId => integer().references(
    Students,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  IntColumn get tournamentId => integer().references(
    Tournament,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  IntColumn get grupId => integer().references(
    Group,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
