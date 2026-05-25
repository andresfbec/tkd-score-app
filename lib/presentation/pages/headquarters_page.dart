import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';

// provider ui
import '../../app/ui_state_provider.dart';

// Mockers
import '../mockers/headquarters_mock.dart';

// Widgets
import '../widgets/table_grid/custom_table.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_search.dart';
import '../widgets/dropdown_filter.dart';
import '../widgets/cards/student_card.dart';
import '../widgets/modals/custom_form_modal.dart';
import 'Students/create_student_page.dart';
import 'Students/edit_students_page.dart';
import '../../core/config/containers/dependency_students.dart';

// Controller
import '../controllers/headquarters_controller.dart';
import '../controllers/students_controller.dart';

// Entities
import '../../domain/entities/headquarters_entity.dart';
import '../../domain/entities/students_entity.dart';

// Utils
import '../../core/utils/format_date.dart';
import '../../core/utils/parse_color.dart';

import '../../core/enums/input_type.dart';
import '../forms/validators.dart';

// notifications
import '../../core/utils/notifications.dart';
import '../../core/enums/status.dart';
import '../../core/utils/status_handler.dart';

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
  // Create
  void showCreateHeadquarterModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => CustomFormModal(
        title: "Crear nueva sede",
        fields: [
          FormFieldConfig(
            name: "name",
            label: "Nombre",
            type: InputType.name,
            validator: (v) => FormValidations.required(v, field: "Nombre"),
          ),
          FormFieldConfig(
            name: "address",
            label: "Dirección",
            type: InputType.text,
            validator: (v) => FormValidations.required(v, field: "Dirección"),
          ),
          FormFieldConfig(
            name: "city",
            label: "Ciudad",
            type: InputType.name,
            validator: (v) => FormValidations.required(v, field: "Ciudad"),
          ),
          FormFieldConfig(
            name: "master",
            label: "Responsable",
            type: InputType.name,
            validator: (v) => FormValidations.required(v, field: "Responsable"),
          ),
          FormFieldConfig(
            name: "phone",
            label: "Teléfono",
            type: InputType.phone,
            validator: FormValidations.validatePhone,
          ),
        ],
        onSubmit: (data) async {
          try {
            await context.read<HeadquartersController>().createHeadquarter(
              name: data["name"] ?? '',
              address: data["address"] ?? '',
              city: data["city"] ?? '',
              master: data["master"] ?? '',
              phone: data["phone"] ?? '',
            );

            // AppNotifications.showSuccess(context, "Sede creada correctamente");
          } catch (e) {
            debugPrint("Error creando sede: $e");
          }
        },
      ),
    );
  }

  // Edit
  void showEditHeadquarterModal(Map<String, dynamic> row) {
    showDialog(
      context: context,
      builder: (dialogContext) => CustomFormModal(
        title: "Editar sede: ${row['name']}",
        initialValues: {
          "name": row["name"],
          "address": row["address"],
          "city": row["city"],
          "master": row["master"],
          "phone": row["phoneNumber"],
        },
        fields: [
          FormFieldConfig(
            name: "name",
            label: "Nombre",
            type: InputType.name,
            validator: (v) => FormValidations.required(v, field: "Nombre"),
          ),
          FormFieldConfig(
            name: "address",
            label: "Dirección",
            type: InputType.text,
            validator: (v) => FormValidations.required(v, field: "Dirección"),
          ),
          FormFieldConfig(
            name: "city",
            label: "Ciudad",
            type: InputType.name,
            validator: (v) => FormValidations.required(v, field: "Ciudad"),
          ),
            FormFieldConfig(
              name: "master",
              label: "Responsable",
              type: InputType.name,
              validator: (v) => FormValidations.required(v, field: "Responsable"),
            ),
          FormFieldConfig(
            name: "phone",
            label: "Teléfono",
            type: InputType.phone,
            validator: FormValidations.validatePhone,
          ),
        ],
        onSubmit: (data) async {
          try {
            await context.read<HeadquartersController>().updateHeadquarter(
              id: row["id"],
              name: data["name"] ?? '',
              address: data["address"] ?? '',
              city: data["city"] ?? '',
              master: data["master"] ?? '',
              phone: data["phone"] ?? '',
            );

            // AppNotifications.showSuccess(
            //   context,
            //   "Sede actualizada correctamente",
            // );
          } catch (e) {
            debugPrint("Error actualizando sede: $e");
          }
        },
      ),
    );
  }

  void showDeleteHeadquarterDialog(Map<String, dynamic> row) {
    showDialog(
      context: context,
      builder: (dialogContext) => ContentDialog(
        title: const Text('Confirmar eliminación'),
        content: Text(
          '¿Estás seguro de que deseas eliminar la sede ${row['name']}?',
        ),
        actions: [
          /// CANCELAR (solo cierra)
          Button(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),

          Button(
            child: const Text('Eliminar'),
            onPressed: () async {
              try {
                await context.read<HeadquartersController>().deleteHeadquarter(
                  row["id"],
                );

                if (!mounted) return;

                // AppNotifications.showSuccess(
                //   context,
                //   "Sede eliminada correctamente",
                // );

                Navigator.pop(dialogContext);
              } catch (e) {
                if (!mounted) return;
                Navigator.pop(dialogContext);

                debugPrint("Error eliminando sede: $e");
              }
            },
            style: ButtonStyle(
              backgroundColor: ButtonState.all(Colors.red),
              foregroundColor: ButtonState.all(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Cuando la página vuelve a estar activa (ej. al cambiar de pestaña),
    // si hay una sede seleccionada en el UIStateProvider, nos aseguramos
    // de que el StudentsController tenga aplicado el filtro correcto.
    final ui = Provider.of<UIStateProvider>(context);
    final studentsController = Provider.of<StudentsController>(context, listen: false);
    final selectedHq = ui.selectedHeadquarter as HeadquartersEntity?;
    
    if (selectedHq != null) {
      // Solo disparamos el stream si el filtro actual del controlador es diferente
      // (así evitamos bucles infinitos y peticiones innecesarias)
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(
      context,
    ); // provider del tema
    final bool isDark = themeProvider.isDarkMode; // tema oscuro o claro
    final ui = context.watch<UIStateProvider>();
    final controller = context.watch<HeadquartersController>();
    final studentsController = context.watch<StudentsController>();

    final HeadquartersEntity? selectedHq = ui.selectedHeadquarter as HeadquartersEntity?;
    final studentsForHq = selectedHq != null ? studentsController.students : [];
    
    
    // mensajes de error y estados
    handleStatus(context, controller); // maneja estados y notificaciones de sedes
    handleStatus(context, studentsController); // maneja estados y notificaciones de alumnos

     /// CLAVE: cada vez que se reconstruya el widget (ej. por un cambio en el provider) sincronizamos la selección del DataGrid con el selectedRow del provider

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
                  onPressed: () => showCreateHeadquarterModal(context),
                  filled: true,
                ),
                const SizedBox(width: 16),

                //  Search con ancho controlado
                SizedBox(
                  width: 250, // ancho fijo más compacto
                  child: FluentSearchBox(
                    placeholder: 'Buscar sede...',
                    onChanged: (value) {
                      controller.updateSearch(value);
                    },
                  ),
                ),

                const Spacer(), // empuja el dropdown hacia la derecha

                if (ui.showHeadquartersDetail && studentsForHq.isNotEmpty) ...[
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
                          '${studentsForHq.length}', 
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

                if (ui.showHeadquartersDetail &&  studentsForHq.isNotEmpty)
                  FluentActionButton(
                    icon: FluentIcons.people_add,
                    label: "Añadir alumno",
                    onPressed: () {
                      if (selectedHq != null) {
                        Navigator.push(
                          context,
                          FluentPageRoute(
                            builder: (context) => StudentFormPage(
                              initialHeadquarterId: selectedHq.id,
                            ),
                          ),
                        );
                      }
                    },
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
                  if (controller.status == Status.loading)
                    Expanded(child: Center(child: ProgressRing()))
                  else
                    Expanded(
                      flex: ui.showHeadquartersDetail ? 5 : 1,
                      child: CustomTable(
                        columns: columns,
                        data: headquartersData,
                        selectedRow: ui.selectedHeadquarterRow,
                        isSameRow: (row1, row2) =>
                            row1['headquarter'].id == row2['headquarter'].id,
                        onRowSelected: (selectedRow) {
                          final hq = selectedRow['headquarter'] as HeadquartersEntity;

                          context.read<UIStateProvider>().selectHeadquarter(
                            hq,
                            selectedRow,
                          );

                          // Filtrado dinámico a través del stream (Backend/Data Layer)
                          context.read<StudentsController>().startListening(
                            hqIds: [hq.id!],
                          );
                        },
                        onEdit: (row) => showEditHeadquarterModal(row),
                        onDelete: (row) => showDeleteHeadquarterDialog(row),
                      ),
                    ),

                  if (ui.showHeadquartersDetail) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: ui.selectedHeadquarterRow != null ?
                      Container(
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
                                  right: 0,
                                ), // espacio para scrollbar
                                itemCount: studentsForHq.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  final student = studentsForHq[index];
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
                                          builder: (context) => StudentEditPage(
                                            student: student,
                                          ),
                                        ),
                                      );
                                    },
                                    onDelete: () {
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
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    onCopy: () {
                                       // Copiar al portapapeles o algo similar
                                       print("Copiar ID: ${student.numberIdentify}");
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ) 
                      :
                      Center(
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
