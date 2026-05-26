import 'package:fluent_ui/fluent_ui.dart';
import '../../../core/constants/app.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/students_entity.dart';

// controller
import '../../controllers/students_controller.dart';

// provider ui
import '../../../app/ui_state_provider.dart';

// Widgets
import '../../widgets/table_grid/custom_table.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/belt_indicator.dart';
import '../../widgets/cards/student_detail_card.dart';
import '../../widgets/input_search.dart';

// notifications
import '../../../core/utils/status_handler.dart';

// modals forms crud
import 'create_student_page.dart';
import 'edit_students_page.dart';
import 'widgets/students_filter_panel.dart';

// helper para formatar la edad a partir de la fecha de nacimiento
import '../../../core/utils/format_date.dart';
import '../../../core/utils/name_utils.dart';

// colores
import '../../../core/utils/parse_color.dart';

// ── Estados de la vista de Alumnos ────────────────────────────────────────
enum _StudentViewState { list, create, edit }

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  _StudentViewState _viewState = _StudentViewState.list;
  StudentsEntity? _studentToEdit;

  // Dirección de la animación: true = entrar desde la derecha, false = salir hacia la derecha
  bool _slideForward = true;


  void _goToCreate() {
    setState(() {
      _slideForward = true;
      _viewState = _StudentViewState.create;
    });
  }

  void _goToEdit(StudentsEntity student) {
    setState(() {
      _slideForward = true;
      _studentToEdit = student;
      _viewState = _StudentViewState.edit;
    });
  }

  void _goToList() {
    setState(() {
      _slideForward = false;
      _viewState = _StudentViewState.list;
      _studentToEdit = null;
    });
  }

  /// Título dinámico del header según la vista activa.
  String get _headerSubtitle {
    switch (_viewState) {
      case _StudentViewState.create:
        return 'Crear Alumno';
      case _StudentViewState.edit:
        return 'Editar Alumno: ${_studentToEdit?.names ?? ''}';
      case _StudentViewState.list:
        return '';
    }
  }

  @override
  void initState() {
    super.initState();
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

    handleStatus(context, studentsController);

    final data = studentsController.filteredStudents.map((student) {
      return {
        'fullName': getShortName(student.names, student.surnames),
        'numberId': student.numberIdentify,
        'age': DateHelper.calculateAge(student.birthDate),
        'headquarter': student.headquarterName ?? 'N/A',
        'belt': student,
        'student': student,
      };
    }).toList();

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

    // ── Título del header ─────────────────────────────────────────────────
    Widget buildTitle() {
      final baseStyle = TextStyle(
        fontSize: AppTypography.titleView,
        fontWeight: AppTypography.semiBold,
        fontFamily: AppTypography.fontFamily,
        color: AppColors.getTextPrimary(isDark),
      );

      if (_viewState == _StudentViewState.list) {
        return Text('Alumnos', style: baseStyle);
      }

      return RichText(
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
                onTap: _goToList,
                child: MouseRegion(
                  cursor: SystemMouseCursors.alias,
                  child: Text('Alumnos', style: baseStyle),
                ),
              ),
            ),
            TextSpan(text: '  >  ', style: baseStyle),
            TextSpan(text: _headerSubtitle, style: baseStyle),
          ],
        ),
      );
    }

    // ── Top bar según la vista ─────────────────────────────────────────────
    Widget buildTopBar() {
      if (_viewState != _StudentViewState.list) {
        return const SizedBox.shrink();
      }
      return Row(
        children: [
          const SizedBox(width: 8),
          FluentActionButton(
            icon: FluentIcons.add,
            label: 'Crear alumno',
            onPressed: _goToCreate,
            filled: true,
          ),
          const SizedBox(width: 16),
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
          if (ui.showStudentsDetail && ui.selectedStudent != null) ...[
            const SizedBox(width: 12),
            const SizedBox(width: 16),
            FluentActionButton(
              icon: FluentIcons.chart_series,
              label: 'Estadisticas',
              onPressed: () {},
              filled: true,
            ),
            const SizedBox(width: 12),
          ],
        ],
      );
    }

    // ── Vista del contenido animado ────────────────────────────────────────
    Widget buildAnimatedContent() {
      Widget currentView;
      final Key viewKey;

      switch (_viewState) {
        case _StudentViewState.create:
          viewKey = const ValueKey('create');
          currentView = StudentFormPage(
            isEmbedded: true,
            onGoBack: _goToList,
          );
          break;
        case _StudentViewState.edit:
          viewKey = ValueKey('edit_${_studentToEdit?.id}');
          currentView = StudentEditPage(
            student: _studentToEdit!,
            isEmbedded: true,
            onGoBack: _goToList,
          );
          break;
        case _StudentViewState.list:
          viewKey = const ValueKey('list');
          currentView = _buildListView(isDark, ui, studentsController, data, columns, headquartersMap);
          break;
      }

      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 280),
        switchInCurve: Curves.easeInOutCubic,
        switchOutCurve: Curves.easeInOutCubic,
        transitionBuilder: (Widget child, Animation<double> animation) {
          // La entrada siempre va de derecha (1.0) a centro (0.0)
          // La salida va de centro (0.0) hacia izquierda (-0.3) con fade
          final slideIn = Tween<Offset>(
            begin: _slideForward ? const Offset(1.0, 0.0) : const Offset(-0.3, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic));

          final fadeIn = Tween<double>(begin: 0.0, end: 1.0)
              .animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));

          return SlideTransition(
            position: slideIn,
            child: FadeTransition(
              opacity: fadeIn,
              child: child,
            ),
          );
        },
        child: KeyedSubtree(
          key: viewKey,
          child: currentView,
        ),
      );
    }

    return Stack(
      children: [
        ScaffoldPage(
          header: PageHeader(
            title: buildTitle(),
            commandBar: _viewState == _StudentViewState.list
                ? Row(
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
                  )
                : null,
          ),
          content: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildTopBar(),
                if (_viewState == _StudentViewState.list) const SizedBox(height: 12),
                Expanded(
                  child: buildAnimatedContent(),
                ),
              ],
            ),
          ),
        ),

        // Panel de filtros (slide desde la derecha)
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

  // ── Vista del listado con tabla + panel de detalles ───────────────────────
  Widget _buildListView(
    bool isDark,
    UIStateProvider ui,
    StudentsController studentsController,
    List<Map<String, dynamic>> data,
    List<Map<String, dynamic>> columns,
    Map<int, String> headquartersMap,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: ui.showStudentsDetail ? 5 : 1,
          child: CustomTable(
            columns: columns,
            data: data,
            selectedRow: ui.selectedStudentRow,
            isSameRow: (row1, row2) => row1['student'].id == row2['student'].id,
            onRowSelected: (selectedRow) {
              final student = selectedRow['student'];
              if (student is StudentsEntity) {
                context.read<UIStateProvider>().selectStudent(student, selectedRow);
              }
            },
            onEdit: (row) {
              final alumnoEditar = row['student'] as StudentsEntity;
              _goToEdit(alumnoEditar);

              final studentActualizado = studentsController.students.firstWhere(
                (s) => s.id == alumnoEditar.id,
                orElse: () => alumnoEditar,
              );
              context.read<UIStateProvider>().selectStudent(studentActualizado, row);
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
                        studentsController.removeStudent(student.id!);
                        if (context.read<UIStateProvider>().selectedStudent?.id == student.id) {
                          context.read<UIStateProvider>().selectStudent(null, {});
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

        // Panel derecho de detalles
        if (ui.showStudentsDetail) ...[
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ui.selectedStudent == null
                ? Center(
                        child: Text(
                          'Sin datos disponibles.',
                          style: FluentTheme.of(context).typography.body
                              ?.copyWith(
                                fontSize: 13,
                                color: isDark
                                    ? Colors.white.withOpacity(0.7)
                                    : Colors.black.withOpacity(0.7),
                              ),
                        ),
                      )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF9F9F9),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: StudentCard(
                          student: ui.selectedStudent as StudentsEntity,
                          headquarters:
                              headquartersMap[ui.selectedStudent!.headquarterId] ?? 'N/A',
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ],
    );
  }
}
