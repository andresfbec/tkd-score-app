import '../../../../domain/entities/tournament_entity.dart';
import 'create_tournament_page.dart';

/// Edición reutilizando el mismo formulario que [CreateTournamentPage].
class EditTournamentPage extends CreateTournamentPage {
  const EditTournamentPage({super.key, required TournamentEntity tournament})
      : super(existing: tournament);
}
