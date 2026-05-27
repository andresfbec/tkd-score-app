import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app.dart';
import '../../../core/enums/status.dart';
import '../../../core/utils/status_handler.dart';
import '../../../domain/entities/tournament_entity.dart';

import '../../controllers/tournaments_controller.dart';
import '../../widgets/cards/tournament_card.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_search.dart';
import 'create_tournament_page.dart';
import 'edit_tournament_page.dart';
import 'combat_settings_page.dart';
import 'tournament_execution_page.dart';
import '../../../core/utils/no_transition_route.dart';

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  void _openExecution(BuildContext context, TournamentEntity t) {
    Navigator.of(context).push(
      NoTransitionPageRoute(
        child: TournamentExecutionPage(tournament: t),
      ),
    );
  }

  void _openCreate(BuildContext context) {
    Navigator.of(context).push(
      NoTransitionPageRoute(
        child: const CreateTournamentPage(),
      ),
    );
  }

  void _openEdit(BuildContext context, TournamentEntity t) {
    Navigator.of(context).push(
      NoTransitionPageRoute(
        child: EditTournamentPage(tournament: t),
      ),
    );
  }

  void _openConfigure(BuildContext context, TournamentEntity t) {
    Navigator.of(context).push(
      NoTransitionPageRoute(
        child: CombatSettingsPage(tournament: t),
      ),
    );
  }

  Future<void> _confirmStart(
    BuildContext context,
    TournamentEntity t,
  ) async {
    if (t.id == null) return;
    await showDialog(
      context: context,
      builder: (dialogContext) => ContentDialog(
        title: const Text('Iniciar torneo'),
        content: Text(
          '¿Pasar "${t.name}" a estado en curso? '
          'Luego no podrás editarlo ni eliminarlo desde aquí.',
        ),
        actions: [
          Button(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(dialogContext),
          ),
          FilledButton(
            child: const Text('Iniciar'),
            onPressed: () async {
              Navigator.pop(dialogContext);
              final ctrl = context.read<TournamentsController>();
              await ctrl.startTournament(
                t.id!,
                hasCombatSettings: false,
                hasGroupsDefined: false,
              );
            },
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, TournamentEntity t) {
    showDialog(
      context: context,
      builder: (dialogContext) => ContentDialog(
        title: const Text('Confirmar eliminación'),
        content: Text('¿Eliminar el torneo "${t.name}"?'),
        actions: [
          Button(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(dialogContext),
          ),
          Button(
            onPressed: () async {
              final nav = Navigator.of(dialogContext);
              final ctrl = context.read<TournamentsController>();
              if (t.id != null) {
                await ctrl.deleteTournament(t.id!);
              }
              if (!context.mounted) return;
              nav.pop();
            },
            style: ButtonStyle(
              backgroundColor: ButtonState.all(Colors.red),
              foregroundColor: ButtonState.all(Colors.white),
            ),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        FluentTheme.of(context).brightness == Brightness.dark;
    final controller = context.watch<TournamentsController>();

    handleStatus(context, controller);

    final list = controller.filteredTournaments;

    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          'Torneos',
          style: TextStyle(
            fontSize: AppTypography.titleView,
            fontWeight: AppTypography.semiBold,
            fontFamily: AppTypography.fontFamily,
            color: AppColors.getTextPrimary(isDark),
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                FluentActionButton(
                  icon: FluentIcons.add,
                  label: 'Crear torneo',
                  onPressed: () => _openCreate(context),
                  filled: true,
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 250,
                  child: FluentSearchBox(
                    placeholder: 'Buscar torneo...',
                    onChanged: controller.updateSearch,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: controller.status == Status.loading && list.isEmpty
                  ? const Center(child: ProgressRing())
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.6,
                      ),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final t = list[index];
                        return TournamentCard(
                          tournament: t,
                          hasCombatSettings: false,
                          hasGroupsDefined: false,
                          onConfigure: () =>
                              _openConfigure(context, t),
                          onStart: () => _confirmStart(context, t),
                          onEdit: () => _openEdit(context, t),
                          onDelete: () => _confirmDelete(context, t),
                          onManageMatches: () => _openExecution(context, t),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
