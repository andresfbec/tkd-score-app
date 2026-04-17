import 'package:drift/drift.dart';
import 'versus.dart';
import 'inscription.dart';

class CombatRounds extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get versusId => integer().references(
    Versus,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();
  IntColumn get roundNumber => integer()();
  IntColumn get pointsA => integer().withDefault(const Constant(0))();
  IntColumn get pointsB => integer().withDefault(const Constant(0))();
  IntColumn get winnerInscriptionId => integer().nullable().references(
    Inscription,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();
  TextColumn get state => text().withDefault(const Constant('pending'))();
  DateTimeColumn get startAt => dateTime()();
  DateTimeColumn get endAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
