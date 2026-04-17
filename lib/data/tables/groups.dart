import 'package:drift/drift.dart';
import 'package:tkd_score/data/tables/tournament.dart';

class Groups extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tournamentId => integer().references(
    Tournament,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();
  TextColumn get name => text()();
  TextColumn get gender => text().withDefault(const Constant('mixed'))();
  IntColumn get ageMin => integer().nullable()();
  IntColumn get ageMax => integer().nullable()();
  RealColumn get weightMin => real().nullable()();
  RealColumn get weightMax => real().nullable()();
  IntColumn get beltFromId => integer().nullable()();
  IntColumn get beltToId => integer().nullable()();
  /// draft | open (inscripciones) | closed (grupo cerrado) | ready
  TextColumn get state => text().withDefault(const Constant('draft'))();
  TextColumn get description => text().withDefault(const Constant(''))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
