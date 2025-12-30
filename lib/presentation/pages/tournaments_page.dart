import 'package:fluent_ui/fluent_ui.dart';

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text("Torneos"),
      ),
      content: const Center(
        child: Text(
          "Page Home Tournaments Dashboard",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}