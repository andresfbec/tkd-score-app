import '../../domain/entities/versus_entity.dart';
import '../../domain/entities/inscriptions_entity.dart';

class MatchNode {
  final int matchNumber;
  final VersusEntity versus;
  final InscriptionsEntity? player1;
  final InscriptionsEntity? player2;
  final InscriptionsEntity? winner;

  MatchNode({
    required this.matchNumber,
    required this.versus,
    this.player1, 
    this.player2,
    this.winner,
  });

  bool get isBye => player1 == null || player2 == null;
}

class BracketRound {
  final int roundIndex;
  final String name;
  final String state;
  final List<MatchNode> matches;

  BracketRound({
    required this.roundIndex,
    required this.name,
    required this.state,
    required this.matches,
  });
}
