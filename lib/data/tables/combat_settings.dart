import 'package:drift/drift.dart';
import 'tournament.dart';

/// Configuración de combate (1:1 con torneo). Se inserta **después** de crear el torneo.
class CombatSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tournamentId => integer().references(
        Tournament,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  IntColumn get roundsMax => integer()();
  TextColumn get formatType => text()();
  IntColumn get roundDurationSeconds => integer()();
  IntColumn get pointsToWin => integer().nullable()();
  IntColumn get playAllRounds => integer().withDefault(const Constant(0))();
  TextColumn get eliminationType => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {tournamentId},
      ];
}
