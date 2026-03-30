import 'package:drift/drift.dart';
import 'inscription.dart';
import 'score.dart';

class Winner extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get inscriptionId => integer().references(
    Inscription,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();
  IntColumn get scoreId => integer().references(
    Score,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
