import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:tkd_score/domain/entities/headquarters_entity.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';

import '../widgets/table_grid/custom_table.dart';

// Controller
import '../controllers/headquarters_controller.dart';

class HeadquartersPage extends StatefulWidget {
  const HeadquartersPage({super.key});

  @override
  State<HeadquartersPage> createState() => _HeadquartersPageState();
}

class _HeadquartersPageState extends State<HeadquartersPage> {
  bool showDetail = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HeadquartersController>().loadHeadquarters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.isDarkMode;

    final controller = context.watch<HeadquartersController>();

    final columns = [
      {'key': 'name', 'label': 'Nombre'},
      {'key': 'address', 'label': 'Dirección'},
      {'key': 'city', 'label': 'Ciudad'},
      {'key': 'phoneNumber', 'label': 'Teléfono'},
      {'key': 'status', 'label': 'Estado'},
    ];

    final tableData = controller.headquarters.map((hq) {
      return {
        'name': hq.name,
        'address': hq.address,
        'city': hq.city,
        'phoneNumber': hq.phoneNumber,
        'status': 'Activo', // Campo adicional para la tabla
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
            Button(
              child: Text(showDetail ? '⬅ Contraer panel' : '➡ Expandir panel'),
              onPressed: () {
                setState(() {
                  showDetail = !showDetail;
                });
              },
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
                Button(
                  child: const Text('➕ Agregar sede (test)'),
                  onPressed: () {
                    context.read<HeadquartersController>().crearSedeDePrueba();
                  },
                ),
                const SizedBox(width: 8),
                Button(
                  child: const Text('🔄 Actualizar primera sede (test)'),
                  onPressed: controller.headquarters.isEmpty
                      ? null
                      : () {
                          context
                              .read<HeadquartersController>()
                              .updateTestHeadquarters();
                        },
                ),
                const SizedBox(width: 8),
                Button(
                  child: const Text('🗑️ Eliminar última sede (test)'),
                  onPressed: controller.headquarters.isEmpty
                      ? null
                      : () {
                          context
                              .read<HeadquartersController>()
                              .deleteTestHeadquarters();
                        },
                ),
                const SizedBox(width: 8),
                if (controller.headquarters.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Cargando datos...'),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('${controller.headquarters.length} sedes'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // MASTER (Tabla)
                  Expanded(
                    flex: showDetail ? 5 : 1,
                    child: CustomTable(
                      columns: columns,
                      data: tableData,
                      onRowSelected: (selectedRow) {
                        print('Selected row data: $selectedRow');

                        final selectedName = selectedRow['name'];
                        final selectedHq = controller.headquarters.firstWhere(
                          (hq) => hq.name == selectedName,
                        );

                        controller.selectHeadquarterForEdit(selectedHq);
                      },
                    ),
                  ),

                  if (showDetail) ...[
                    const SizedBox(width: 16),
                    // DETAIL (Panel derecho)
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isDark
                              ? const Color(0xFF2B2B2B)
                              : const Color(0xFFF3F3F3),
                        ),
                        child: controller.selectedHeadquarter == null
                            ? const Center(
                                child: Text(
                                  'Selecciona una sede para ver detalles',
                                ),
                              )
                            : _buildDetailPanel(
                                controller.selectedHeadquarter!,
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

  Widget _buildDetailPanel(HeadquartersEntity hq) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detalles de la Sede',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildDetailRow('ID:', hq.id.toString()),
        _buildDetailRow('Nombre:', hq.name),
        _buildDetailRow('Dirección:', hq.address),
        _buildDetailRow('Ciudad:', hq.city),
        _buildDetailRow('Teléfono:', hq.phoneNumber),
        const SizedBox(height: 16),
        Row(
          children: [
            Button(
              child: const Text('Editar'),
              onPressed: () {
                // Aquí iría la lógica para editar
              },
            ),
            const SizedBox(width: 8),
            Button(
              child: const Text('Eliminar'),
              onPressed: () {
                // Aquí iría la lógica para eliminar
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
