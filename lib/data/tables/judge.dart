import 'package:drift/drift.dart';
import 'tournament.dart';

class Judge extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get names => text()();
  TextColumn get club => text().withDefault(const Constant(''))();
  TextColumn get phone => text().withDefault(const Constant(''))();
  TextColumn get document => text()();
  TextColumn get rank => text().withDefault(const Constant(''))();
  IntColumn get participations => integer().withDefault(const Constant(0))();

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
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();
  IntColumn get tournamentId => integer().references(
    Tournament,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
