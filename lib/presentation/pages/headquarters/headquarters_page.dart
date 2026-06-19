import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../app/ui_state_provider.dart';
import '../../../core/enums/status.dart';
import '../../../core/utils/status_handler.dart';
import '../../../core/config/containers/dependency_students.dart';
import '../../controllers/headquarters_controller.dart';
import '../../controllers/students_controller.dart';
import '../../widgets/table_grid/custom_table.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_search.dart';
import '../../../domain/entities/headquarters_entity.dart';
import '../../../domain/entities/students_entity.dart';
import '../students/create_student_page.dart';
import 'dialogs/headquarter_dialogs.dart';
import 'widgets/students_panel.dart';

class HeadquartersPage extends StatelessWidget {
  const HeadquartersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final containerStudents = InjectionStudents();
    return ChangeNotifierProvider<StudentsController>(
      create: (_) => StudentsController(
        createUseCase: containerStudents.createStudent,
        updateUseCase: containerStudents.updateStudent,
        deleteUseCase: containerStudents.deleteStudent,
        watchUseCase: containerStudents.watchStudents,
      ),
      child: const _HeadquartersPageContent(),
    );
  }
}

class _HeadquartersPageContent extends StatefulWidget {
  const _HeadquartersPageContent({super.key});

  @override
  State<_HeadquartersPageContent> createState() => _HeadquartersPageContentState();
}

class _HeadquartersPageContentState extends State<_HeadquartersPageContent> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ui = Provider.of<UIStateProvider>(context);
    final studentsController = Provider.of<StudentsController>(context, listen: false);
    final selectedHq = ui.selectedHeadquarter as HeadquartersEntity?;

    if (selectedHq != null) {
      final currentHqIds = studentsController.currentHqIds;
      final isAlreadyFiltered = currentHqIds != null &&
          currentHqIds.isNotEmpty &&
          currentHqIds.first == selectedHq.id;

      if (!isAlreadyFiltered) {
        Future.microtask(() {
          if (mounted) {
            studentsController.startListening(hqIds: [selectedHq.id!]);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final ui = context.watch<UIStateProvider>();
    final controller = context.watch<HeadquartersController>();
    final studentsController = context.watch<StudentsController>();

    final HeadquartersEntity? selectedHq = ui.selectedHeadquarter as HeadquartersEntity?;
    final List<StudentsEntity> studentsForHq = selectedHq != null ? studentsController.students : [];

    handleStatus(context, controller);
    handleStatus(context, studentsController);

    final columns = [
      {'key': 'name', 'label': 'Nombre'},
      {'key': 'address', 'label': 'Dirección'},
      {'key': 'city', 'label': 'Ciudad'},
      {'key': 'master', 'label': 'Responsable'},
      {'key': 'phoneNumber', 'label': 'Teléfono'},
    ];

    final headquartersData = controller.filteredHeadquarters.map((hq) {
      return {
        'id': hq.id,
        'name': hq.name,
        'address': hq.address,
        'city': hq.city,
        'master': hq.master,
        'phoneNumber': hq.phoneNumber,
        'headquarter': hq,
      };
    }).toList();

    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          'Sedes',
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
              icon: FluentIcons.p_b_i_home_layout_expanded,
              label: 'Alumnos',
              onPressed: () {
                context.read<UIStateProvider>().toggleHeadquartersDetail();
              },
              filled: false,
            ),
          ],
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildToolbar(context, controller, ui, selectedHq, studentsForHq, isDark),
            const SizedBox(height: 12),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTable(context, controller, ui, isDark, columns, headquartersData),
                  if (ui.showHeadquartersDetail) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: selectedHq != null && studentsForHq.isNotEmpty
                          ? StudentsPanel(
                              selectedHq: selectedHq,
                              students: studentsForHq,
                              isDark: isDark,
                            )
                          : StudentsPanelEmpty(isDark: isDark),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolbar(
    BuildContext context,
    HeadquartersController controller,
    UIStateProvider ui,
    HeadquartersEntity? selectedHq,
    List studentsForHq,
    bool isDark,
  ) {
    return Row(
      children: [
        const SizedBox(width: 8),
        FluentActionButton(
          icon: FluentIcons.add,
          label: 'Crear sede',
          onPressed: () => showCreateHeadquarterModal(context),
          filled: true,
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 250,
          child: FluentSearchBox(
            placeholder: 'Buscar sede...',
            onChanged: controller.updateSearch,
          ),
        ),
        const Spacer(),
        if (ui.showHeadquartersDetail && studentsForHq.isNotEmpty) ...[
          const SizedBox(width: 12),
          _buildStudentCountBadge(context, studentsForHq.length, isDark),
          const SizedBox(width: 12),
          FluentActionButton(
            icon: FluentIcons.people_add,
            label: "Añadir alumno",
            onPressed: () => Navigator.push(
              context,
              FluentPageRoute(
                builder: (_) => StudentFormPage(
                  initialHeadquarterId: selectedHq!.id,
                ),
              ),
            ),
            filled: true,
          ),
        ],
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _buildStudentCountBadge(BuildContext context, int count, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.04)
            : Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FluentIcons.info,
            size: 14,
            color: isDark
                ? Colors.white.withOpacity(0.6)
                : Colors.black.withOpacity(0.6),
          ),
          const SizedBox(width: 6),
          Text(
            '$count',
            style: FluentTheme.of(context).typography.body?.copyWith(
                  fontSize: 13,
                  color: isDark
                      ? Colors.white.withOpacity(0.7)
                      : Colors.black.withOpacity(0.7),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildTable(
    BuildContext context,
    HeadquartersController controller,
    UIStateProvider ui,
    bool isDark,
    List<Map<String, String>> columns,
    List<Map<String, dynamic>> data,
  ) {
    if (controller.status == Status.loading) {
      return const Expanded(child: Center(child: ProgressRing()));
    }

    return Expanded(
      flex: ui.showHeadquartersDetail ? 5 : 1,
      child: CustomTable(
        columns: columns,
        data: data,
        selectedRow: ui.selectedHeadquarterRow,
        isSameRow: (row1, row2) =>
            row1['headquarter'].id == row2['headquarter'].id,
        onRowSelected: (selectedRow) {
          final hq = selectedRow['headquarter'] as HeadquartersEntity;
          context.read<UIStateProvider>().selectHeadquarter(hq, selectedRow);
          context.read<StudentsController>().startListening(hqIds: [hq.id!]);
        },
        onEdit: (row) => showEditHeadquarterModal(context, row),
        onDelete: (row) => showDeleteHeadquarterDialog(context, row),
      ),
    );
  }
}
