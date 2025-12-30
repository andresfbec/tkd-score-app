import 'package:fluent_ui/fluent_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text("Ajustes"),
      ),
      content: const Center(
        child: Text(
          "Page Settings",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}