import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

// Controller
import '../controllers/user_controller.dart';
// Widget tabla
import '../widgets/data_table.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UserController>();

    final headers = ['ID', 'Usuario', 'Sede'];

    final rows = controller.users.map((user) {
      return [user.id.toString(), user.username, user.headquarters.toString()];
    }).toList();

    return ScaffoldPage(
      header: const PageHeader(title: Text("Usuarios")),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  BOTÓN DE TEST
            Button(
              child: const Text('➕Crear nuevo usuario de prueba'),
              onPressed: () {
                context.read<UserController>().createTestUsers();
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: rows.isEmpty
                  ? const Center(child: Text('No hay usuarios registrados'))
                  : FluentDataTable(headers: headers, rows: rows),
            ),
          ],
        ),
      ),
    );
  }
}
