import 'package:equatable/equatable.dart';

class VersusEntity extends Equatable {
  final int? id;
  final int tournamentId;
  final int? inscriptionAId;
  final int? inscriptionBId;
  final int groupId;
  final int? winnerInscriptionId;
  final int bracketRound;
  final int bracketOrder;
  final int? nextVsWinnerId;
  final int? nextVsLoserId;
  final String state;
  final String roundState;

  const VersusEntity({
    this.id,
    required this.tournamentId,
    this.inscriptionAId,
    this.inscriptionBId,
    required this.groupId,
    this.winnerInscriptionId,
    this.bracketRound = 1,
    this.bracketOrder = 1,
    this.nextVsWinnerId,
    this.nextVsLoserId,
    this.state = 'pending',
    this.roundState = 'draft',
  });

  VersusEntity copyWith({
    int? id,
    int? tournamentId,
    int? inscriptionAId,
    int? inscriptionBId,
    int? groupId,
    int? winnerInscriptionId,
    int? bracketRound,
    int? bracketOrder,
    int? nextVsWinnerId,
    int? nextVsLoserId,
    String? state,
    String? roundState,
  }) {
    return VersusEntity(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      inscriptionAId: inscriptionAId ?? this.inscriptionAId,
      inscriptionBId: inscriptionBId ?? this.inscriptionBId,
      groupId: groupId ?? this.groupId,
      winnerInscriptionId: winnerInscriptionId ?? this.winnerInscriptionId,
      bracketRound: bracketRound ?? this.bracketRound,
      bracketOrder: bracketOrder ?? this.bracketOrder,
      nextVsWinnerId: nextVsWinnerId ?? this.nextVsWinnerId,
      nextVsLoserId: nextVsLoserId ?? this.nextVsLoserId,
      state: state ?? this.state,
      roundState: roundState ?? this.roundState,
    );
  }

  @override
  List<Object?> get props => [
        id,
        tournamentId,
        inscriptionAId,
        inscriptionBId,
        groupId,
        winnerInscriptionId,
        bracketRound,
        bracketOrder,
        nextVsWinnerId,
        nextVsLoserId,
        state,
        roundState,
      ];
}
