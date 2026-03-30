import 'package:drift/drift.dart';

class Tournament extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get location => text()();
  DateTimeColumn get dateStart => dateTime()();
  DateTimeColumn get dateEnd => dateTime()();
  TextColumn get status => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
