import 'package:fluent_ui/fluent_ui.dart';
import './connection_status.dart'; // Estado de conexión a Internet

// ----- PAGES -----
import '../pages/tournaments_page.dart';
import '../pages/settings_page.dart';
import '../pages/judges_page.dart';
import '../pages/headquarters_page.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 0;

  // Datos simulados (listos para estado real)
  final String userName = 'AdminTKD05';
  final int tournamentsRegistered = 3;
  final int registeredCenters = 5;
  final int registeredStudents = 150;
  final bool isCloudSynced = true;
  final bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        title: _buildHeaderLeft(), // Usuario + KPIs
        actions: _buildHeaderRight(), // Estado del sistema
      ),
      pane: NavigationPane(
        selected: index,
        onChanged: (i) => setState(() => index = i),
        displayMode: PaneDisplayMode.auto,
        items: [
          PaneItem(
            icon: Icon(FluentIcons.trophy2),
            title: Text('Torneos'),
            body: TournamentsPage(),
          ),
          PaneItem(
            icon: Icon(FluentIcons.city_next),
            title: Text('Sedes'),
            body: HeadquartersPage(),
          ),
          PaneItem(
            icon: Icon(FluentIcons.contact_card),
            title: Text('Jueces'),
            body: JudgesPage(),
          ),
          PaneItem(
            icon: Icon(FluentIcons.settings),
            title: Text('Ajustes'),
            body: SettingsPage(),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // IZQUIERDA — USUARIO + KPIs de información rapida
  // ============================================================
  Widget _buildHeaderLeft() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(FluentIcons.contact, size: 15),
        const SizedBox(width: 6),
        Text(
          'Usuario: $userName',
          style: const TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DERECHA — ESTADO DEL SISTEMA
  // ============================================================
  Widget _buildHeaderRight() {
    final Color cloudColor = isCloudSynced ? Colors.blue : Colors.grey;

    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(FluentIcons.cloud, size: 16, color: cloudColor),
          const SizedBox(width: 4),
          Text(
            isCloudSynced ? 'Datos sincronizados' : 'Sin sincronizar',
            style: TextStyle(fontSize: 12, color: cloudColor),
          ),

          const SizedBox(width: 12),

          const ConnectionStatus(),

          const SizedBox(width: 8),

          IconButton(
            icon: const Icon(FluentIcons.ringer),
            onPressed: () {
              // TODO: abrir notificaciones
            },
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SEPARADOR VISUAL
  // ============================================================
  Widget _separator() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 20,
      width: 1,
      color: Colors.grey.withOpacity(0.4),
    );
  }
}
