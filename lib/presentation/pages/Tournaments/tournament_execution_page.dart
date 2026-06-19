import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/tournament_entity.dart';
import '../../controllers/groups_controller.dart';
import '../../controllers/inscriptions_controller.dart';
import '../../../core/enums/status.dart';
import '../../../core/utils/status_handler.dart';
import '../../../core/constants/app.dart';
import 'visualization_combat_diagram/combat_visualization_page.dart';
import '../../../core/utils/no_transition_route.dart';
// INTEGRACIÓN: Importación del nuevo componente de tarjeta
import '../../widgets/cards/group_execution_card.dart'; 

class TournamentExecutionPage extends StatefulWidget {
  final TournamentEntity tournament;

  const TournamentExecutionPage({super.key, required this.tournament});

  @override
  State<TournamentExecutionPage> createState() =>
      _TournamentExecutionPageState();
}

class _TournamentExecutionPageState extends State<TournamentExecutionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GroupsController>().loadGroups(widget.tournament.id!);
      context.read<InscriptionsController>().loadInscriptions(
            widget.tournament.id!,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final groupsCtrl = context.watch<GroupsController>();
    final insCtrl = context.watch<InscriptionsController>();
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    handleStatus(context, groupsCtrl);

    return ScaffoldPage(
      header: PageHeader(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: AppTypography.titleView,
              color: isDark ? Colors.white : Colors.black,
              fontFamily: 'Segoe UI',
            ),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.alias,
                    child: Text(
                      'Torneos',
                      style: TextStyle(
                        fontSize: AppTypography.titleView,
                        fontWeight: AppTypography.semiBold,
                        fontFamily: AppTypography.fontFamily,
                        color: AppColors.getTextPrimary(isDark),
                      ),
                    ),
                  ),
                ),
              ),
              const TextSpan(text: '  >  '),
              TextSpan(
                text: 'Grupos de combate',
                style: TextStyle(
                  fontSize: AppTypography.titleView,
                  fontWeight: AppTypography.semiBold,
                  fontFamily: AppTypography.fontFamily,
                  color: AppColors.getTextPrimary(isDark),
                ),
              ),
            ],
          ),
        ),
      ),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: InfoBar(
              title: const Text('Torneo en Curso'),
              content: Text(
                'Ubicación: ${widget.tournament.location} | Disciplina: ${widget.tournament.discipline}',
              ),
              severity: InfoBarSeverity.info,
              isIconVisible: true,
            ),
          ),
          Expanded(
            child: groupsCtrl.status == Status.loading && groupsCtrl.groups.isEmpty
                ? const Center(child: ProgressRing())
                : groupsCtrl.groups.isEmpty
                    ? const Center(
                        child: Text('No hay grupos configurados para este torneo.'),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        itemCount: groupsCtrl.groups.length,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 460, 
                          mainAxisExtent: 300,    
                          crossAxisSpacing: 20,   
                          mainAxisSpacing: 20,    
                        ),
                        itemBuilder: (context, index) {
                          final group = groupsCtrl.groups[index];
                          final groupInscriptions = insCtrl.getInscriptionsByGroup(
                            group.id!,
                          );

                          // INTEGRACIÓN: Uso de la clase pública externa
                          return GroupExecutionCard(
                            group: group,
                            participants: groupInscriptions,
                            onExecuteMatches: () {
                              Navigator.push(
                                context,
                                NoTransitionPageRoute(
                                  child: CombatVisualizationPage(
                                    groupId: group.id!,
                                    tournamentId: widget.tournament.id!,
                                    groupName: group.name,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}