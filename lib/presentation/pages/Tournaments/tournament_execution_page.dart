import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/tournament_entity.dart';
import '../../../domain/entities/groups_entity.dart';
import '../../../domain/entities/inscriptions_entity.dart';
import '../../controllers/groups_controller.dart';
import '../../controllers/inscriptions_controller.dart';
import '../../../core/enums/status.dart';
import '../../../core/utils/status_handler.dart';
import '../../../core/utils/format_date.dart';
import '../../../core/constants/app.dart';
import 'combat_visualization_page.dart';
import '../../../core/utils/no_transition_route.dart';

class TournamentExecutionPage extends StatefulWidget {
  final TournamentEntity tournament;

  const TournamentExecutionPage({super.key, required this.tournament});

  @override
  State<TournamentExecutionPage> createState() => _TournamentExecutionPageState();
}

class _TournamentExecutionPageState extends State<TournamentExecutionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GroupsController>().loadGroups(widget.tournament.id!);
      context.read<InscriptionsController>().loadInscriptions(widget.tournament.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final groupsCtrl = context.watch<GroupsController>();
    final insCtrl = context.watch<InscriptionsController>();
    // print('insCtrl.inscriptions: ${insCtrl.inscriptions}');
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
                // text: 'Grupos de Combate para Torneo ${widget.tournament.name}',
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
              content: Text('Ubicación: ${widget.tournament.location} | Disciplina: ${widget.tournament.discipline}'),
              severity: InfoBarSeverity.info,
              isIconVisible: true,
            ),
          ),
          Expanded(
            child: groupsCtrl.status == Status.loading && groupsCtrl.groups.isEmpty
                ? const Center(child: ProgressRing())
                : groupsCtrl.groups.isEmpty
                    ? const Center(child: Text('No hay grupos configurados para este torneo.'))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        itemCount: groupsCtrl.groups.length,
                        itemBuilder: (context, index) {
                          final group = groupsCtrl.groups[index];
                          final groupInscriptions = insCtrl.getInscriptionsByGroup(group.id!);

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _GroupExecutionCard(
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
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

class _GroupExecutionCard extends StatelessWidget {
  final GroupsEntity group;
  final List<InscriptionsEntity> participants;
  final VoidCallback onExecuteMatches;

  const _GroupExecutionCard({
    required this.group,
    required this.participants,
    required this.onExecuteMatches,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Expander(
      header: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${group.gender} | ${group.ageMin ?? 0}-${group.ageMax ?? 99} años | ${group.weightMin ?? 0}-${group.weightMax ?? 999}kg',
                  style: TextStyle(fontSize: 12, color: theme.typography.caption!.color),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          InfoBadge(
            source: Text('${participants.length}'),
          ),
          const SizedBox(width: 16),
          FilledButton(
            onPressed: participants.length < 2 ? null : onExecuteMatches,
            child: const Text('Ejecutar Combates'),
          ),
        ],
      ),
      content: participants.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('No hay participantes asignados a este grupo.'),
            )
          : Column(
              children: participants.map((p) => _ParticipantTile(inscription: p)).toList(),
            ),
    );
  }
}

class _ParticipantTile extends StatelessWidget {
  final InscriptionsEntity inscription;

  const _ParticipantTile({required this.inscription});

  @override
  Widget build(BuildContext context) {
    final age = inscription.studentBirthDate != null 
        ? DateHelper.calculateAge(inscription.studentBirthDate!) 
        : 0;

    return ListTile(
      leading: const Icon(FluentIcons.contact),
      title: Text('${inscription.studentNames ?? ""} ${inscription.studentSurnames ?? ""}'),
      subtitle: Text(
        'Sede: ${inscription.headquartersName ?? "N/A"} | Edad: $age | Peso: ${inscription.studentWeight ?? 0}kg | Cinturón: ${inscription.studentBeltName ?? "N/A"}',
      ),
    );
  }
}
