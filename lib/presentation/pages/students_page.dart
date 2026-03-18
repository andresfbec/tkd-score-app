import 'package:fluent_ui/fluent_ui.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

// Widgets
import '../widgets/table_grid/custom_table.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_search.dart';
import '../widgets/belt_indicator.dart';

// Mocker
import '../mockers/students_mock.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  bool showDetail = false;

  @override
  Widget build(BuildContext context) {
    final bool isDark = FluentTheme.of(context).brightness == Brightness.dark;

    /// 🔹 Columnas base (puedes cambiarlas luego)
    final columns = [
      {'key': 'fullName', 'label': 'Nombre'},
      {'key': 'numberId', 'label': 'Documento'},
      {'key': 'age', 'label': 'Edad', 'width': 90.0},
      {'key': 'headquarter', 'label': 'Sede'},
      {
        'key': 'belt',
        'label': 'Cinturón',
        'renderer': (value) {
          final student = value as StudentMock;

          return BeltIndicator(
            leftColor: student.leftBelt,
            rightColor: student.rightBelt,
          );
        },
      },
    ];

    final headquartersMap = {1: 'Centro', 2: 'Norte', 3: 'Sur'};

    /// 🔹 Data vacía (placeholder)
    final data = mockStudents.map((student) {
      return {
        'fullName': student.fullName,
        'numberId': student.numberId,
        'age': student.age,
        'headquarter': headquartersMap[student.headquarterId] ?? 'N/A',
        'belt': student, // renderer del cinturon
      };
    }).toList();

    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          'Estudiantes',
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
              icon: FluentIcons.user_window,
              label: 'Detalles',
              onPressed: () {
                setState(() {
                  showDetail = !showDetail;
                });
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
            /// 🔹 TOP BAR
            Row(
              children: [
                /// ➕ Crear
                FluentActionButton(
                  icon: FluentIcons.add,
                  label: 'Añadir estudiante',
                  onPressed: () {},
                  filled: true,
                ),

                const SizedBox(width: 16),

                /// 🔍 Search
                SizedBox(
                  width: 250,
                  child: FluentSearchBox(
                    placeholder: 'Buscar...',
                    onChanged: (value) {},
                  ),
                ),

                const Spacer(),

                /// 🔹 Acciones lado derecho
                // if (showDetail) ...[
                //   const SizedBox(width: 12),

                //   /// Info compacta
                //   Container(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 10,
                //       vertical: 6,
                //     ),
                //     decoration: BoxDecoration(
                //       color: isDark
                //           ? Colors.white.withOpacity(0.04)
                //           : Colors.black.withOpacity(0.04),
                //       borderRadius: BorderRadius.circular(6),
                //     ),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: const [
                //         Icon(FluentIcons.info, size: 14),
                //         SizedBox(width: 6),
                //         Text('0'),
                //       ],
                //     ),
                //   ),

                //   const SizedBox(width: 16),

                //   /// Botón acción
                //   FluentActionButton(
                //     icon: FluentIcons.add_friend,
                //     label: "Añadir",
                //     onPressed: () {},
                //     filled: true,
                //   ),
                // ],
              ],
            ),

            const SizedBox(height: 12),

            /// 🔹 TABLA + PANEL DERECHO
            Expanded(
              child: Row(
                children: [
                  /// 📊 TABLA
                  Expanded(
                    flex: showDetail ? 5 : 1,
                    child: CustomTable(
                      columns: columns,
                      data: data,
                      onRowSelected: (row) {},
                    ),
                  ),

                  /// 👉 PANEL DERECHO
                  if (showDetail) ...[
                    const SizedBox(width: 12),

                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isDark
                              ? const Color(0xFF1E1E1E)
                              : const Color(0xFFF9F9F9),
                        ),
                        child: const Center(child: Text('Detalle / contenido')),
                      ),
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
}
