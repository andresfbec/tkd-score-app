import 'package:drift/drift.dart';
import 'package:tkd_score/data/tables/groups.dart';
import 'inscription.dart';

class Versus extends Table {
  IntColumn get id => integer().autoIncrement()();

  @ReferenceName('inscription1')
  IntColumn get inscription1Id => integer().references(
    Inscription,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();
  @ReferenceName('inscription2')
  IntColumn get inscription2Id => integer().references(
    Inscription,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  IntColumn get grupid => integer().references(
    Groups,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
