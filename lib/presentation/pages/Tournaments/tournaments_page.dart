import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app.dart';
import '../../core/enums/status.dart';
import '../../core/utils/status_handler.dart';
import '../../domain/entities/tournament_entity.dart';

import '../controllers/tournaments_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_search.dart';
import 'Tournaments/create_tournament_page.dart';
import 'Tournaments/edit_tournament_page.dart';

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  String _formatDate(DateTime d) {
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  void _openCreate(BuildContext context) {
    Navigator.of(context).push(
      FluentPageRoute(
        builder: (_) => const CreateTournamentPage(),
      ),
    );
  }

  void _openEdit(BuildContext context, TournamentEntity t) {
    Navigator.of(context).push(
      FluentPageRoute(
        builder: (_) => EditTournamentPage(tournament: t),
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
                        childAspectRatio: 1.25,
                      ),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final t = list[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isDark
                                ? const Color(0xFF1E1E1E)
                                : const Color(0xFFF9F9F9),
                            border: Border.all(
                              color: isDark
                                  ? Colors.white.withOpacity(0.06)
                                  : Colors.black.withOpacity(0.06),
                            ),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      t.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(FluentIcons.edit, size: 16),
                                    onPressed: () => _openEdit(context, t),
                                  ),
                                  IconButton(
                                    icon:
                                        const Icon(FluentIcons.delete, size: 16),
                                    onPressed: () => _confirmDelete(context, t),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                t.location,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark
                                      ? Colors.white.withOpacity(0.7)
                                      : Colors.black.withOpacity(0.65),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${_formatDate(t.dateStart)} → ${_formatDate(t.dateEnd)}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: isDark
                                      ? Colors.white.withOpacity(0.55)
                                      : Colors.black.withOpacity(0.5),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    FluentIcons.tag,
                                    size: 14,
                                    color: FluentTheme.of(context).accentColor,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      '${t.status} · ${t.setupPhase}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color:
                                            FluentTheme.of(context).accentColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
