import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';

import '../mockers/headquarters_mock.dart';
import '../widgets/table_grid/custom_table.dart';


// Controller
import '../controllers/headquarters_controller.dart';


class HeadquartersPage extends StatefulWidget {
  const HeadquartersPage({super.key});

  @override
  State<HeadquartersPage> createState() => _HeadquartersPageState();
}

class _HeadquartersPageState extends State<HeadquartersPage> {
  bool showDetail = false; // estado para mostrar/ocultar panel derecho

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
    ];

    final rows = MockHeadquartersData.headquarters.map((hq) {
      return [
        hq['name'].toString(),
        hq['address'].toString(),
        hq['city'].toString(),
        hq['phoneNumber'].toString(),
        hq['status'].toString(),
      ];
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
            Button(
              child: const Text('➕ Agregar sede (test)'),
              onPressed: () {
                context.read<HeadquartersController>().createTestHeadquarters();
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // MASTER (Tabla)
                  Expanded(
                    flex: showDetail ? 5 : 1, // se expande si el panel está oculto
                    child: CustomTable(
                      columns: columns,
                      data: MockHeadquartersData.headquarters,
                      onRowSelected: (selectedRow) {
                        print('Selected row data: $selectedRow');
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
                        child: const Center(
                          child: Text(
                            'Selecciona una sede para ver detalles',
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
