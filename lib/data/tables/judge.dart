import 'package:drift/drift.dart';
import 'tournament.dart';

class Judge extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get names => text()();
  TextColumn get surnames => text()();
  TextColumn get identify => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}

class JudgeTournament extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get judgeId => integer().references(
    Judge,
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

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
