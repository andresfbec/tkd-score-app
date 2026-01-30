import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

// Controller
import '../controllers/headquarters_controller.dart';

// Widget tabla
import '../widgets/data_table.dart';

class HeadquartersPage extends StatelessWidget {
  const HeadquartersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HeadquartersController>();

    final headers = ['ID', 'Nombre', 'Dirección', 'Ciudad', 'Teléfono'];

    final rows = controller.headquarters.map((hq) {
      return [
        hq.id.toString(),
        hq.name,
        hq.address,
        hq.city,
        hq.phoneNumber,
      ];
    }).toList();

    return ScaffoldPage(
      header: const PageHeader(title: Text("Sedes")),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  BOTÓN DE TEST
            Button(
              child: const Text('➕ Agregar sede (test)'),
              onPressed: () {
                context
                    .read<HeadquartersController>()
                    .createTestHeadquarters();
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: rows.isEmpty
                  ? const Center(child: Text('No hay sedes registradas'))
                  : FluentDataTable(
                      headers: headers,
                      rows: rows,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
