import 'package:fluent_ui/fluent_ui.dart';

class JudgesPage extends StatelessWidget {
  const JudgesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text("Jueces"),
      ),
      content: const Center(
        child: Text(
          "Page Judges",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}