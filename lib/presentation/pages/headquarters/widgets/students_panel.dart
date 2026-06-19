import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app.dart';
import '../../../../core/utils/format_date.dart';
import '../../../../core/utils/parse_color.dart';
import '../../../../domain/entities/students_entity.dart';
import '../../../../domain/entities/headquarters_entity.dart';
import '../../../controllers/students_controller.dart';
import '../../../widgets/cards/student_card.dart';
import '../../students/edit_students_page.dart';

/// Panel lateral que muestra la lista de alumnos de la sede seleccionada.
class StudentsPanel extends StatelessWidget {
  final HeadquartersEntity selectedHq;
  final List<StudentsEntity> students;
  final bool isDark;

  const StudentsPanel({
    super.key,
    required this.selectedHq,
    required this.students,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final studentsController = context.read<StudentsController>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF9F9F9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(right: 0),
              itemCount: students.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final student = students[index];
                return StudentCard(
                  fullName: "${student.names} ${student.surnames}",
                  age: DateHelper.calculateAge(student.birthDate),
                  idNumber: student.numberIdentify,
                  leftBeltColor: ColorParser.fromName(student.beltPrimaryColor),
                  rightBeltColor: ColorParser.fromName(student.beltSecondaryColor),
                  onEdit: () {
                    Navigator.push(
                      context,
                      FluentPageRoute(
                        builder: (_) => StudentEditPage(student: student),
                      ),
                    );
                  },
                  onDelete: () => _showDeleteStudentDialog(
                    context,
                    student,
                    studentsController,
                  ),
                  onCopy: () {
                    debugPrint("Copiar ID: ${student.numberIdentify}");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteStudentDialog(
    BuildContext context,
    StudentsEntity student,
    StudentsController controller,
  ) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('¿Eliminar alumno?'),
        content: Text(
          '¿Estás seguro de que deseas eliminar a ${student.names}? Esta acción no se puede deshacer.',
        ),
        actions: [
          Button(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
          FilledButton(
            style: ButtonStyle(
              backgroundColor: ButtonState.all(Colors.red),
            ),
            onPressed: () {
              controller.removeStudent(student.id!);
              Navigator.pop(context);
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}

/// Placeholder cuando no hay sede seleccionada en el panel lateral.
class StudentsPanelEmpty extends StatelessWidget {
  final bool isDark;

  const StudentsPanelEmpty({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sin datos disponibles.',
        style: FluentTheme.of(context).typography.body?.copyWith(
              fontSize: 13,
              color: isDark
                  ? Colors.white.withOpacity(0.7)
                  : Colors.black.withOpacity(0.7),
            ),
      ),
    );
  }
}
