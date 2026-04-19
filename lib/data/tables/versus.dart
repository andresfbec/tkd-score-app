import 'package:drift/drift.dart';
import 'package:tkd_score/data/tables/groups.dart';
import 'inscription.dart';
import 'tournament.dart';

class Versus extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tournamentId => integer().references(
    Tournament,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();

  @ReferenceName('inscription1')
  IntColumn get inscriptionAId => integer().references(
    Inscription,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();
  @ReferenceName('inscription2')
  IntColumn get inscriptionBId => integer().references(
    Inscription,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();

  IntColumn get groupId => integer().references(
    Groups,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();
  IntColumn get winnerInscriptionId => integer().nullable().references(
    Inscription,
    #id,
    onDelete: KeyAction.restrict,
    onUpdate: KeyAction.cascade,
  )();
  IntColumn get bracketRound => integer().withDefault(const Constant(1))();
  IntColumn get bracketOrder => integer().withDefault(const Constant(1))();
  IntColumn get nextVsWinnerId => integer().nullable().references(
    Versus,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();
  IntColumn get nextVsLoserId => integer().nullable().references(
    Versus,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();
  TextColumn get state => text().withDefault(const Constant('pending'))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get synchronized => integer().withDefault(const Constant(0))();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
}
