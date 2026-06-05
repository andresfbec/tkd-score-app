import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../../../domain/entities/groups_entity.dart';
import '../../../../controllers/inscriptions_controller.dart';
import '../../../../controllers/groups_controller.dart';
import '../../../../../core/utils/format_date.dart';

class GroupParticipantsManager extends StatefulWidget {
  final GroupsEntity group;
  const GroupParticipantsManager({super.key, required this.group});

  @override
  State<GroupParticipantsManager> createState() => _GroupParticipantsManagerState();
}

class _GroupParticipantsManagerState extends State<GroupParticipantsManager> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InscriptionsController>().loadInscriptions(widget.group.tournamentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final insCtrl = context.watch<InscriptionsController>();
    final groupsCtrl = context.read<GroupsController>();
    final isDark = FluentTheme.of(context).brightness == Brightness.dark;
    
    // Todas las inscripciones del torneo
    final allInscriptions = insCtrl.inscriptions;
    
    // Inscripciones que ya están en este grupo
    final inGroup = allInscriptions.where((ins) => ins.groupId == widget.group.id).toList();
    
    // Inscripciones que NO tienen grupo asignado
    final unassigned = allInscriptions.where((ins) => ins.groupId == null).toList();
    
    // Inscripciones que están en OTROS grupos (para mostrarlas si se desea, o para saber que existen)
    final inOtherGroups = allInscriptions.where((ins) => ins.groupId != null && ins.groupId != widget.group.id).toList();

    return ContentDialog(
      title: Text('Gestionar Participantes: ${widget.group.name}'),
      constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
      content: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FluentIcons.info, size: 14, color: isDark ? const Color.fromARGB(255, 184, 184, 184) : Colors.black),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  'Selecciona los alumnos que quieres asignar a este grupo.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: isDark ? const Color.fromARGB(255, 190, 190, 190) : const Color.fromARGB(255, 85, 85, 85),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: [
                if (inGroup.isNotEmpty) ... [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('En este grupo:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                  ),
                  ...inGroup.map((ins) => _buildInscriptionTile(ins, true, groupsCtrl, context)),
                ],
                if (unassigned.isNotEmpty) ... [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Alumnos sin grupo asignado:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ...unassigned.map((ins) => _buildInscriptionTile(ins, false, groupsCtrl, context)),
                ],
                if (allInscriptions.isEmpty)
                  const Center(child: Text('No hay alumnos inscritos en este torneo.')),
              ],
            ),
          ),
        ],
      ),
      actions: [
        FilledButton(
          child: const Text('Cerrar'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildInscriptionTile(dynamic ins, bool isSelected, GroupsController groupsCtrl, BuildContext context) {
    final age = ins.studentBirthDate != null ? DateHelper.calculateAge(ins.studentBirthDate!) : 0;
    
    return ListTile(
      leading: Checkbox(
        checked: isSelected,
        onChanged: (v) async {
          if (v == true) {
            await groupsCtrl.updateInscriptionGroup(ins.id, widget.group.id);
          } else {
            await groupsCtrl.updateInscriptionGroup(ins.id, null);
          }
          // Recargar inscripciones para que la UI se actualice
          if (context.mounted) {
            context.read<InscriptionsController>().loadInscriptions(widget.group.tournamentId);
          }
        },
      ),
      title: Text('${ins.studentNames ?? ""} ${ins.studentSurnames ?? ""}'),
      subtitle: Text('Edad: $age | Peso: ${ins.studentWeight ?? 0}kg | Cinturón: ${ins.studentBeltName ?? "N/A"}'),
      trailing: ins.groupId != null && ins.groupId != widget.group.id
        ? Text('(En: ${ins.groupName ?? "otro grupo"})', style: TextStyle(fontSize: 10, color: Colors.warningPrimaryColor))
        : (ins.groupId == null ? const Text('Sin grupo', style: TextStyle(fontSize: 10, color: Colors.grey)) : null),
    );
  }
}
