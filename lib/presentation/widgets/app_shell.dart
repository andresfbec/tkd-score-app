// este archivo define la estructura principal de la aplicación con una barra de navegación lateral

import 'package:fluent_ui/fluent_ui.dart';
import '../pages/tournaments_page.dart'; // (home) tournaments page
import '../pages/settings_page.dart'; // settings page
import '../pages/judges_page.dart'; // judges page
import '../pages/headquarters_page.dart'; // headquarters page

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
  automaticallyImplyLeading: false,
  title: const Text('Taekwondo Scoring'),
  actions: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, //  reparte el espacio
    children: const [
      Icon(FluentIcons.wifi),
      Icon(FluentIcons.ringer),
      Icon(FluentIcons.contact),
    ],
  ),
),
      pane: NavigationPane(
        displayMode: PaneDisplayMode.auto,
        selected: index,
        onChanged: (i) => setState(() => index = i),
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.trophy2),
            title: const Text('Torneos'),
            body: const TournamentsPage(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.contact_card),
            title: const Text('Jueces'),
            body: const JudgesPage(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.city_next),
            title: const Text('Sedes'),
            body: const HeadquartersPage(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Ajustes'),
            body: const SettingsPage(),
          ),
        ],
      ),
    );
  }
}