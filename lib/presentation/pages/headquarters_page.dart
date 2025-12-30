import 'package:fluent_ui/fluent_ui.dart';

class HeadquartersPage extends StatelessWidget {
  const HeadquartersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text("Sedes"),
      ),
      content: const Center(
        child: Text(
          "Page Headquarters",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}