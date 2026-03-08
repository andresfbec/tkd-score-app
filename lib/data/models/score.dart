import 'package:drift/drift.dart';
import 'judge.dart';
import 'versus.dart';
import 'sogis.dart';

class Score extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get scoreOne => real()();
  RealColumn get scoreTwo => real()();

  IntColumn get judgeId => integer().references(
    Judge,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  IntColumn get versusId => integer().references(
    Versus,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();
  @ReferenceName('sogisOne')
  IntColumn get sogisOne => integer().references(
    Sogis,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  @ReferenceName('sogisTwo')
  IntColumn get sogisTwo => integer().references(
    Sogis,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
