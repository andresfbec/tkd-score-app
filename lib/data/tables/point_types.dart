import 'package:drift/drift.dart';

class PointTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get pointsValue => integer()();
  TextColumn get bodyZone => text()(); // 'TRUNK', 'HEAD', 'NONE'
  TextColumn get techniqueType => text()(); // 'PUNCH', 'REGULAR_KICK', 'SPINNING_KICK', 'PENALTY'
  BoolColumn get isPenalty => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
