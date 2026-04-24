import 'package:fluent_ui/fluent_ui.dart';
import '../../../domain/entities/tournament_entity.dart';

class GroupsTournament extends StatelessWidget {
  final TournamentEntity tournament;

  const GroupsTournament({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Grupos en construcción',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
