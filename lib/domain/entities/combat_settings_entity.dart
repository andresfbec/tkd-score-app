import 'package:equatable/equatable.dart';

class CombatSettingsEntity extends Equatable {
  final int? id;
  final int tournamentId;
  final int roundsMax;
  final String formatType;
  final int roundDurationSeconds;
  final int? pointsToWin;
  final int playAllRounds;
  final String eliminationType;

  const CombatSettingsEntity({
    this.id,
    required this.tournamentId,
    required this.roundsMax,
    required this.formatType,
    required this.roundDurationSeconds,
    this.pointsToWin,
    required this.playAllRounds,
    required this.eliminationType,
  });

  CombatSettingsEntity copyWith({
    int? id,
    int? tournamentId,
    int? roundsMax,
    String? formatType,
    int? roundDurationSeconds,
    int? pointsToWin,
    int? playAllRounds,
    String? eliminationType,
  }) {
    return CombatSettingsEntity(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      roundsMax: roundsMax ?? this.roundsMax,
      formatType: formatType ?? this.formatType,
      roundDurationSeconds: roundDurationSeconds ?? this.roundDurationSeconds,
      pointsToWin: pointsToWin ?? this.pointsToWin,
      playAllRounds: playAllRounds ?? this.playAllRounds,
      eliminationType: eliminationType ?? this.eliminationType,
    );
  }

  @override
  List<Object?> get props => [
        id,
        tournamentId,
        roundsMax,
        formatType,
        roundDurationSeconds,
        pointsToWin,
        playAllRounds,
        eliminationType,
      ];
}
