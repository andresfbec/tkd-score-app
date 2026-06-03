import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../core/enums/status.dart';
import '../../../core/utils/status_handler.dart';
import '../../../core/utils/format_date.dart';
import '../../../domain/entities/tournament_entity.dart';
import '../../../domain/entities/students_entity.dart';
import '../../controllers/students_controller.dart';
import '../../controllers/inscriptions_controller.dart';

class InscriptionsTournament extends StatefulWidget {
  final TournamentEntity tournament;

  const InscriptionsTournament({super.key, required this.tournament});

  @override
  State<InscriptionsTournament> createState() => _InscriptionsTournamentState();
}

class _InscriptionsTournamentState extends State<InscriptionsTournament> {
  @override
  void initState() {
    super.initState();
    // Cargamos las inscripciones actuales al iniciar la pestaña
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InscriptionsController>().loadInscriptions(widget.tournament.id!);
      context.read<StudentsController>().startListening(); // Aseguramos que se vean todos los alumnos de todas las sedes
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    
    final studentCtrl = context.watch<StudentsController>();
    final insCtrl = context.watch<InscriptionsController>();
    
    // Escuchamos cambios de estado para mostrar toasts/mensajes
    handleStatus(context, insCtrl);

    // Agrupamos estudiantes por sede
    final groupedStudents = _groupStudentsBySede(studentCtrl.students);

    return ScaffoldPage(
      content: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 100, left: 24, right: 24, top: 20),
                  children: [
                    if (studentCtrl.students.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Text('No hay estudiantes registrados en el aplicativo.'),
                        ),
                      ),
                    ...groupedStudents.entries.map((entry) {
                      final sedeName = entry.key;
                      final studentsInSede = entry.value;
                      final studentIds = studentsInSede.map((s) => s.id!).toList();
                      
                      // Verificamos si todos los de esta sede están seleccionados
                      final allSelected = studentIds.every((id) => insCtrl.selectedStudentIds.contains(id));
                      final someSelected = studentIds.any((id) => insCtrl.selectedStudentIds.contains(id)) && !allSelected;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Expander(
                          header: Row(
                            children: [
                              Checkbox(
                                checked: allSelected ? true : (someSelected ? null : false),
                                onChanged: (v) {
                                  insCtrl.toggleSedeSelection(studentIds, v ?? false);
                                },
                              ),
                              const SizedBox(width: 12),
                              Text(
                                sedeName,
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '(${studentsInSede.length})',
                                style: TextStyle(
                                  color: theme.typography.caption?.color,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          content: Column(
                            children: studentsInSede.map((student) {
                              final isSelected = insCtrl.selectedStudentIds.contains(student.id);
                              return ListTile(
                                leading: Checkbox(
                                  checked: isSelected,
                                  onChanged: (v) => insCtrl.toggleStudentSelection(student.id!),
                                ),
                                title: Text('${student.names} ${student.surnames}', style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                                subtitle: Text(
                                  'ID: ${student.numberIdentify} • Edad: ${DateHelper.calculateAge(student.birthDate)} años • Cinturón: ${student.beltName ?? "Sin cinturón"}',
                                ),
                                onPressed: () => insCtrl.toggleStudentSelection(student.id!),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          
          // Botón flotante inferior para confirmar
          Positioned(
            bottom: 20,
            right: 20,
            left: 20,
            child: Center(
              child: SizedBox(
                width: 200,
                child: FilledButton(
                  onPressed: insCtrl.status == Status.loading 
                      ? null 
                      : () => insCtrl.syncInscriptions(widget.tournament.id!),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (insCtrl.status == Status.loading)
                          const Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: ProgressRing(),
                            ),
                          ),
                        Text(
                          insCtrl.selectedStudentIds.isEmpty 
                              ? 'Sin inscripciones' 
                              : (insCtrl.hasChanges ? 'Confirmar Inscripciones' : 'Inscripciones al día'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, List<StudentsEntity>> _groupStudentsBySede(List<StudentsEntity> students) {
    final Map<String, List<StudentsEntity>> groups = {};
    for (var s in students) {
      final sede = s.headquarterName ?? 'Sin Sede';
      groups.putIfAbsent(sede, () => []).add(s);
    }
    return groups;
  }
}
