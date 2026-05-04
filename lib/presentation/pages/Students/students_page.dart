import 'package:fluent_ui/fluent_ui.dart';
import '../../../core/constants/app.dart';
import '../../../core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/students_entity.dart';

// controller
import '../../controllers/students_controller.dart';

// provider ui
import '../../../app/ui_state_provider.dart';

// Widgets
import '../../widgets/table_grid/custom_table.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_search.dart';
import '../../widgets/belt_indicator.dart';
import '../../widgets/cards/student_detail_card.dart';
import '../../widgets/modals/custom_form_modal.dart';

import '../../../core/enums/input_type.dart';
import '../../forms/validators.dart';

// Mocker
import '../../mockers/students_mock.dart';

// notifications
import '../../../core/utils/notifications.dart';
import '../../../core/enums/status.dart';
import '../../../core/utils/status_handler.dart';

// modals forms crud
import 'create_student_page.dart';
import 'edit_students_page.dart';
import 'widgets/students_filter_panel.dart';

//injections
import '../../../core/config/containers/dependency_students.dart';

// helper para formatar la edad a partir de la fecha de nacimiento
import '../../../core/utils/format_date.dart';
import '../../../core/utils/name_utils.dart';

// colores
import '../../../core/utils/parse_color.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  void initState() {
    super.initState();
    // Al entrar a la página de alumnos, mantenemos los filtros actuales del controlador
    // para evitar que se desincronice el panel de filtros con la tabla.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = context.read<StudentsController>();
      controller.startListening(
        hqIds: controller.currentHqIds,
        beltIds: controller.currentBeltIds,
        gender: controller.currentGender,
        minAge: controller.currentMinAge,
        maxAge: controller.currentMaxAge,
        minWeight: controller.currentMinWeight,
        maxWeight: controller.currentMaxWeight,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = FluentTheme.of(context).brightness == Brightness.dark;
    final ui = context.watch<UIStateProvider>();
    final studentsController = context.watch<StudentsController>();

    handleStatus(
      context,
      studentsController,
    ); // maneja estados y notificaciones

    /// 🔹 Data vacía (placeholder)
    final data = studentsController.filteredStudents.map((student) {
      return {
        'fullName': getShortName(student.names, student.surnames),
        'numberId': student.numberIdentify,
        'age': DateHelper.calculateAge(student.birthDate),
        'headquarter':
            student.headquarterName ??
            'N/A', // Aquí podrías mapear el ID a un nombre de sede si tienes esa info
        'belt': student, // renderer del cinturon (belt indicator)
        'student': student, // para detalles (la card details)
      };
    }).toList();

    /// 🔹 Columnas base (puedes cambiarlas luego)
    final columns = [
      {'key': 'fullName', 'label': 'Nombre'},
      {'key': 'numberId', 'label': 'Documento'},
      {'key': 'age', 'label': 'Edad', 'width': 90.0},
      {'key': 'headquarter', 'label': 'Sede'},
      {
        'key': 'belt',
        'label': 'Cinturón',
        'allowSorting': false,
        'renderer': (value) {
          final student = value as StudentsEntity;

          return BeltIndicator(
            leftColor: ColorParser.fromName(student.beltPrimaryColor),
            rightColor: ColorParser.fromName(student.beltSecondaryColor),
          );
        },
      },
    ];

    final headquartersMap = {1: 'Centro', 2: 'Norte', 3: 'Sur'};

    return Stack(
      children: [
        ScaffoldPage(
          header: PageHeader(
            title: Text(
              'Alumnos',
              style: TextStyle(
                fontSize: AppTypography.titleView,
                fontWeight: AppTypography.semiBold,
                fontFamily: AppTypography.fontFamily,
                color: AppColors.getTextPrimary(isDark),
              ),
            ),
            commandBar: Row(
              children: [
                const Spacer(),
                FluentActionButton(
                  icon: FluentIcons.contact_info,
                  label: 'Detalles',
                  onPressed: () {
                    context.read<UIStateProvider>().toggleStudentsDetail();
                  },
                  filled: false,
                ),
              ],
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                //  TOP BAR
                Row(
                  children: [
                    const SizedBox(width: 8),

                    /// Crear
                    FluentActionButton(
                      icon: FluentIcons.add,
                      label: 'Crear alumno',
                      onPressed: () {
                        Navigator.push(
                          context,
                          FluentPageRoute(
                            builder: (context) => const StudentFormPage(),
                          ),
                        );
                      },
                      filled: true,
                    ),

                    const SizedBox(width: 16),

                    ///  Search
                    SizedBox(
                      width: 250,
                      child: FluentSearchBox(
                        placeholder: 'Buscar alumno...',
                        onChanged: (value) {
                          studentsController.updateSearch(value);
                        },
                      ),
                    ),

                    const SizedBox(width: 16),

                    FluentActionButton(
                      icon: FluentIcons.filter,
                      label: studentsController.activeFiltersCount > 0
                          ? 'Filtros (${studentsController.activeFiltersCount})'
                          : 'Filtros',
                      onPressed: () {
                        ui.toggleStudentsFilter();
                      },
                    ),

                    const Spacer(),

                    ///  Acciones lado derecho
                    if (ui.showStudentsDetail && ui.selectedStudent != null) ...[
                      const SizedBox(width: 12),

                      /// Info compacta
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 10,
                      //     vertical: 6,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: isDark
                      //         ? Colors.white.withOpacity(0.04)
                      //         : Colors.black.withOpacity(0.04),
                      //     borderRadius: BorderRadius.circular(6),
                      //   ),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: const [
                      //       Icon(FluentIcons.info, size: 14),
                      //       SizedBox(width: 6),
                      //       Text('0'),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(width: 16),

                      /// Botón para llevar a estadísticas del alumno
                      FluentActionButton(
                        icon: FluentIcons.chart_series,
                        label: "Estadisticas",
                        onPressed: () {},
                        filled: true,
                      ),
                      const SizedBox(width: 12),
                    ],
                  ],
                ),

                const SizedBox(height: 12),

                ///  TABLA + PANEL DERECHO
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///  TABLA
                      Expanded(
                        flex: ui.showStudentsDetail ? 5 : 1,
                        child: CustomTable(
                          columns: columns,
                          data: data,
                          selectedRow: ui.selectedStudentRow,
                          isSameRow: (row1, row2) =>
                              row1['student'].id == row2['student'].id,
                          onRowSelected: (selectedRow) {
                            final student = selectedRow['student'];

                            if (student is StudentsEntity) {
                              context.read<UIStateProvider>().selectStudent(
                                student,
                                selectedRow,
                              );
                            } else {
                              print(
                                'Error: No se pudo obtener el estudiante de la fila seleccionada',
                              );
                            }
                          },
                          onEdit: (row) {
                            final alumnoEditar = row['student'] as StudentsEntity;

                            Navigator.push(
                              context,
                              FluentPageRoute(
                                builder: (context) =>
                                    StudentEditPage(student: alumnoEditar),
                              ),
                            );

                            final studentActualizado = studentsController.students
                                .firstWhere(
                                  (s) => s.id == alumnoEditar.id,
                                  orElse: () => alumnoEditar,
                                );

                            // 3. Actualizamos la selección en la UI para que la Card se refresque
                            // Pasamos el objeto nuevo y la misma fila (row) para mantener el highlight
                            context.read<UIStateProvider>().selectStudent(
                              studentActualizado,
                              row,
                            );
                          },
                          onDelete: (row) {
                            final student = row['student'] as StudentsEntity;

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
                                    child: const Text('Eliminar'),
                                    onPressed: () {
                                      // Tu lógica directa:
                                      studentsController.removeStudent(student.id!);

                                      // Limpiar la selección en la UI si el alumno borrado estaba seleccionado
                                      if (context
                                              .read<UIStateProvider>()
                                              .selectedStudent
                                              ?.id ==
                                          student.id) {
                                        context
                                            .read<UIStateProvider>()
                                            .selectStudent(null, {});
                                      }

                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      ///  PANEL DERECHO
                      if (ui.showStudentsDetail) ...[
                        const SizedBox(width: 12),

                        Expanded(
                          flex: 2,
                          child: ui.selectedStudent == null
                              ? Center(
                                  child: Text(
                                    "Selecciona un alumno para ver detalles",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isDark
                                          ? const Color.fromARGB(255, 236, 236, 236)
                                          : const Color.fromARGB(255, 8, 8, 8),
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: isDark
                                        ? const Color(0xFF1E1E1E)
                                        : const Color(0xFFF9F9F9),
                                  ),

                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 12, // separación del scroll
                                      ),
                                      child: StudentCard(
                                        student:
                                            ui.selectedStudent as StudentsEntity,
                                        headquarters:
                                            headquartersMap[ui
                                                .selectedStudent!
                                                .headquarterId] ??
                                            'N/A',
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Panel de filtros (Sobre toda la página y con slide)
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          top: 0,
          bottom: 0,
          right: ui.showStudentsFilter ? 0 : -310,
          child: const StudentsFilterPanel(),
        ),
      ],
    );
  }
}
