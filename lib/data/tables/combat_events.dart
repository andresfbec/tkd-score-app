import 'package:drift/drift.dart';
import 'combat_rounds.dart';
import 'point_types.dart';

class CombatEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get roundId => integer().references(
    CombatRounds,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();
  IntColumn get pointTypeId => integer().references(
    PointTypes,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();
  TextColumn get targetParticipant => text()();
  RealColumn get pointsDelta => real()();
  RealColumn get matchSeconds => real().nullable()();
  IntColumn get registeredByJudgeId => integer().nullable()();

  // Audit trail: events are never deleted, only marked as omitted/corrected.
  IntColumn get isValid => integer().withDefault(const Constant(1))();
  DateTimeColumn get invalidatedAt => dateTime().nullable()();
  TextColumn get invalidationReason => text().nullable()();
  IntColumn get replacesEventId => integer().nullable().references(
    CombatEvents,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
