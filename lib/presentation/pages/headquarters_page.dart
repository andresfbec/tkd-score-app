import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';

// provider ui
import '../../app/ui_state_provider.dart';

// Mockers
import '../mockers/headquarters_mock.dart';
import '../mockers/students_card_mock.dart';

// Widgets
import '../widgets/table_grid/custom_table.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_search.dart';
import '../widgets/dropdown_filter.dart';
import '../widgets/student_card.dart';

// Controller
import '../controllers/headquarters_controller.dart';

class HeadquartersPage extends StatefulWidget {
  const HeadquartersPage({super.key});

  @override
  State<HeadquartersPage> createState() => _HeadquartersPageState();
}

class _HeadquartersPageState extends State<HeadquartersPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(
      context,
    ); // provider del tema
    final bool isDark = themeProvider.isDarkMode; // tema oscuro o claro
    final ui = context.watch<UIStateProvider>();
    final controller = context.watch<HeadquartersController>();
    final error = controller.errorMessage;

    if (error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (_) => ContentDialog(
            title: const Text('Error'),
            content: Text(error),
            actions: [
              Button(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );

        controller.clearError(); // limpiar error
      });
    }

    final columns = [
      {'key': 'name', 'label': 'Nombre'},
      {'key': 'address', 'label': 'Dirección'},
      {'key': 'city', 'label': 'Ciudad'},
      {'key': 'phoneNumber', 'label': 'Teléfono'},
    ];

    final headquartersData = controller.headquarters.map((hq) {
      return {
        'id': hq.id,
        'name': hq.name,
        'address': hq.address,
        'city': hq.city,
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
            const Spacer(), // empuja todo lo que sigue hacia la derecha
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
            Row(
              children: [
                const SizedBox(width: 8),
                //  Botón crear (siempre primero a la izquierda)
                FluentActionButton(
                  icon: FluentIcons.add,
                  label: 'Crear sede',
                  onPressed: () {
                    context.read<HeadquartersController>().createHeadquarter(
                      name: 'Buchido PaloBlanco',
                      address: 'Cra 174 9na 50',
                      city: 'Bogotá',
                      phone: '32521452',
                    );
                  },
                  filled: true,
                ),
                const SizedBox(width: 16),

                //  Search con ancho controlado
                SizedBox(
                  width: 250, // ancho fijo más compacto
                  child: FluentSearchBox(
                    placeholder: 'Buscar sede...',
                    onChanged: (value) {
                      if (value.isEmpty) {
                        controller.reset();
                      } else {
                        controller.search(name: value);
                      }
                      // aquí podrías filtrar controller.headquarters
                    },
                  ),
                ),

                const Spacer(), // empuja el dropdown hacia la derecha

                if (ui.showHeadquartersDetail) ...[
                  const SizedBox(width: 12),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
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
                          '24', // numero de alumnos en la sede seleccionada (ponerlo mas adelante dinámico)
                          style: FluentTheme.of(context).typography.body
                              ?.copyWith(
                                fontSize: 13,
                                color: isDark
                                    ? Colors.white.withOpacity(0.7)
                                    : Colors.black.withOpacity(0.7),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(width: 12),

                if (ui.showHeadquartersDetail)
                  FluentActionButton(
                    icon: FluentIcons.people_add,
                    label: "Añadir alumno",
                    onPressed: () {},
                    filled: true,
                  ),

                const SizedBox(width: 12),

                // // ⬇️ Dropdown filtro con ancho controlado
                // SizedBox(
                //   width: 180, // ancho fijo más compacto
                //   child: FluentDropdownFilter(
                //     label: 'Estado',
                //     options: ['Activo', 'Inactivo', 'Pendiente'],
                //     selected: 'Activo',
                //     onChanged: (value) {
                //       print('Filtro seleccionado: $value');
                //       // aquí podrías aplicar el filtro al dataset
                //     },
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 12),

            // Tabla + Panel derecho
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.isLoading)
                    Expanded(child: Center(child: ProgressRing()))
                  else
                    Expanded(
                      flex: ui.showHeadquartersDetail ? 5 : 1,
                      child: CustomTable(
                        columns: columns,
                        data: headquartersData,
                        selectedRow: ui.selectedHeadquarterRow,
                        isSameRow: (row1, row2) => row1['headquarter'].id == row2['headquarter'].id,
                        onRowSelected: (selectedRow) {
                          final hq = selectedRow['headquarter'];

                          context.read<UIStateProvider>().selectHeadquarter(
                            hq,
                            selectedRow,
                          );
                        },
                      ),
                    ),

                  if (ui.showHeadquartersDetail) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isDark
                              ? const Color(
                                  0xFF1E1E1E,
                                ) // Un tono más oscuro para resaltar las cards
                              : const Color(0xFFF9F9F9),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // // Encabezado del panel
                            // Text(
                            //   'Alumnos de la Sede',
                            //   style: TextStyle(
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.bold,
                            //     color: AppColors.getTextPrimary(isDark),
                            //   ),
                            // ),
                            // const SizedBox(height: 16),

                            // Lista de Alumnos
                            Expanded(
                              child: ListView.separated(
                                padding: const EdgeInsets.only(
                                  right: 12,
                                ), // espacio para scrollbar
                                itemCount: mockStudents.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  final student = mockStudents[index];
                                  return StudentCard(
                                    fullName: student.fullName,
                                    age: student.age,
                                    idNumber: student.idNumber,
                                    leftBeltColor: student.leftBelt,
                                    rightBeltColor: student.rightBelt,
                                    onEdit: () =>
                                        print("Editar: ${student.fullName}"),
                                    onDelete: () =>
                                        print("Borrar: ${student.fullName}"),
                                    onCopy: () =>
                                        print("Copiar ID: ${student.idNumber}"),
                                  );
                                },
                              ),
                            ),
                          ],
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
    );
  }
}
