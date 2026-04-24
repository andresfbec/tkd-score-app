import '../../core/config/db/database.dart';

class InscriptionWithInfo {
  final InscriptionData inscription;
  final Student student;
  final TournamentData tournament;
  final Group? group;

  InscriptionWithInfo({
    required this.inscription,
    required this.student,
    required this.tournament,
    this.group,
  });
}
