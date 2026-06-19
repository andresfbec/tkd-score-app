import 'package:equatable/equatable.dart';

class CombatRoundsEntity extends Equatable {
  final int? id;
  final int versusId;
  final int roundNumber;
  final int pointsA;
  final int pointsB;
  final int? winnerInscriptionId;
  final String state;
  final DateTime startAt;
  final DateTime? endAt;

  const CombatRoundsEntity({
    this.id,
    required this.versusId,
    required this.roundNumber,
    this.pointsA = 0,
    this.pointsB = 0,
    this.winnerInscriptionId,
    this.state = 'pending',
    required this.startAt,
    this.endAt,
  });

  CombatRoundsEntity copyWith({
    int? id,
    int? versusId,
    int? roundNumber,
    int? pointsA,
    int? pointsB,
    int? winnerInscriptionId,
    String? state,
    DateTime? startAt,
    DateTime? endAt,
  }) {
    return CombatRoundsEntity(
      id: id ?? this.id,
      versusId: versusId ?? this.versusId,
      roundNumber: roundNumber ?? this.roundNumber,
      pointsA: pointsA ?? this.pointsA,
      pointsB: pointsB ?? this.pointsB,
      winnerInscriptionId: winnerInscriptionId ?? this.winnerInscriptionId,
      state: state ?? this.state,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        versusId,
        roundNumber,
        pointsA,
        pointsB,
        winnerInscriptionId,
        state,
        startAt,
        endAt,
      ];
}
