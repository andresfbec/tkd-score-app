import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/tournament_entity.dart';
import '../../controllers/groups_controller.dart';
import '../../../core/enums/status.dart';
import '../../../core/utils/status_handler.dart';
import 'manual_group_form.dart';
import 'group_participants_manager.dart';

class GroupsTournament extends StatefulWidget {
  final TournamentEntity tournament;
  const GroupsTournament({super.key, required this.tournament});

  @override
  State<GroupsTournament> createState() => _GroupsTournamentState();
}

class _GroupsTournamentState extends State<GroupsTournament> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GroupsController>().loadGroups(widget.tournament.id!);
    });
  }

  void _showManualGroupForm() {
    showDialog(
      context: context,
      builder: (context) => ManualGroupForm(tournamentId: widget.tournament.id!),
    );
  }

  void _showParticipantsManager(dynamic group) {
    showDialog(
      context: context,
      builder: (context) => GroupParticipantsManager(group: group),
    );
  }

  @override
  Widget build(BuildContext context) {
    final groupsCtrl = context.watch<GroupsController>();
    handleStatus(context, groupsCtrl);

    return ScaffoldPage(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              alignment: WrapAlignment.start,
              children: [
                Button(
                  onPressed: _showManualGroupForm,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(FluentIcons.add),
                      SizedBox(width: 8),
                      Text('Crear Nuevo Grupo'),
                    ],
                  ),
                ),
                if (groupsCtrl.groups.isNotEmpty)
                  Button(
                    onPressed: () => groupsCtrl.deleteGroups(widget.tournament.id!),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(FluentIcons.delete),
                        const SizedBox(width: 8),
                        Text('Eliminar Grupos', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: groupsCtrl.status == Status.loading && groupsCtrl.groups.isEmpty
                ? const Center(child: ProgressRing())
                : groupsCtrl.groups.isEmpty
                    ? const Center(
                        child: Text(
                            'No hay grupos creados.'))
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 8),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 350,
                          mainAxisExtent: 160,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: groupsCtrl.groups.length,
                        itemBuilder: (context, index) {
                          final group = groupsCtrl.groups[index];
                          final hasParticipants = group.participantsCount! > 0;
                          
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        group.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 14),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(FluentIcons.delete, size: 14),
                                      onPressed: () => groupsCtrl.deleteGroup(group.id!),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${group.gender} | ${group.ageMin ?? 0}-${group.ageMax ?? 99} años | ${group.weightMin ?? 0}-${group.weightMax ?? 999}kg',
                                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Icon(
                                      FluentIcons.people,
                                      size: 16,
                                      color: hasParticipants
                                          ? Colors.green
                                          : Colors.orange,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${group.participantsCount} Inscritos',
                                      style: TextStyle(
                                        color: hasParticipants
                                            ? Colors.green
                                            : Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  width: double.infinity,
                                  child: Button(
                                    onPressed: () => _showParticipantsManager(group),
                                    child: const Text('Gestionar Participantes'),
                                  ),
                                )
                              ],
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
