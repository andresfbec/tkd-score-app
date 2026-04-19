import 'package:drift/drift.dart';

import '../../domain/entities/tournament_entity.dart';
import '../../core/config/db/database.dart';

class TournamentMapper {
  static TournamentEntity fromData(TournamentData data) {
    return TournamentEntity(
      id: data.id,
      name: data.name,
      host: data.host,
      location: data.location,
      dateStart: data.dateStart,
      dateEnd: data.dateEnd,
      status: data.status,
      discipline: data.discipline,
      setupPhase: data.setupPhase,
    );
  }

  static TournamentCompanion toCompanion(TournamentEntity entity) {
    return TournamentCompanion(
      id: entity.id != null ? Value(entity.id!) : const Value.absent(),
      name: Value(entity.name),
      host: Value(entity.host),
      location: Value(entity.location),
      dateStart: Value(entity.dateStart),
      dateEnd: Value(entity.dateEnd),
      status: Value(entity.status),
      discipline: Value(entity.discipline),
      setupPhase: Value(entity.setupPhase),
    );
  }
}
