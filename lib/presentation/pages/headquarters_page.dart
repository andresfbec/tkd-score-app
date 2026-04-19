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
import '../widgets/cards/student_card.dart';
import '../widgets/modals/custom_form_modal.dart';

// Controller
import '../controllers/headquarters_controller.dart';

import '../../core/enums/input_type.dart';
import '../forms/validators.dart';

// notifications
import '../../core/utils/notifications.dart';
import '../../core/enums/status.dart';
import '../../core/utils/status_handler.dart';

class HeadquartersPage extends StatefulWidget {
  const HeadquartersPage({super.key});

  @override
  State<HeadquartersPage> createState() => _HeadquartersPageState();
}

class _HeadquartersPageState extends State<HeadquartersPage> {
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
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(
      context,
    ); // provider del tema
    final bool isDark = themeProvider.isDarkMode; // tema oscuro o claro
    final ui = context.watch<UIStateProvider>();
    final controller = context.watch<HeadquartersController>();
    
    
    // mensajes de error y estados
    handleStatus(context, controller); // maneja estados y notificaciones

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
                          final hq = selectedRow['headquarter'];

                          context.read<UIStateProvider>().selectHeadquarter(
                            hq,
                            selectedRow,
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
