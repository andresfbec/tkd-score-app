// lib/presentation/widgets/app_shell.dart
import 'package:fluent_ui/fluent_ui.dart';
import '../../core/constants/app.dart';

// ----- WIDGETS -----
import '../widgets/connection_status.dart';
import '../widgets/user_badge.dart';
import '../widgets/calendars/date_badge.dart';
import '../widgets/calendars/tournament_calendar.dart';

import '../../core/utils/no_transition_route.dart';

// ----- PAGES -----
import '../pages/Tournaments/tournaments_page.dart';
import '../pages/settings_page.dart';
import '../pages/judges_page.dart';
import '../pages/headquarters_page.dart';
import '../pages/users_page_.dart';
import '../pages/Students/students_page.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 0;

  final _tournamentsNavigatorKey = GlobalKey<NavigatorState>();
  final _studentsNavigatorKey = GlobalKey<NavigatorState>();

  // Datos simulados
  final String userName = 'AdminTKD05';
  final bool isCloudSynced = true;
  final String nombres = "Andres";
  final String apellidos = "Becerra";

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Izquierda: UserBadge minimalista
            UserBadge(firstName: nombres, lastName: apellidos),

            // Centro: Calendario centrado
            Expanded(
              child: Center(
                child: TournamentCalendar(),
              ),
            ),

            // Derecha: Estado del sistema
            _buildHeaderRight(),
          ],
        ),
        actions: null,
      ),
      pane: NavigationPane(
        selected: index,
        onChanged: (i) => setState(() => index = i),
        displayMode: PaneDisplayMode.compact,
        toggleable: false,
        menuButton: const SizedBox.shrink(),
        size: const NavigationPaneSize(
          compactWidth: 78.0,
        ),
        items: _buildSidebarItems(),
      ),
    );
  }

  // ============================================================
  // ITEMS DEL SIDEBAR/MENÚ
  // ============================================================
  List<NavigationPaneItem> _buildSidebarItems() {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Widget buildIcon(IconData icon, String label, bool isSelected) {
      final baseColor = isDark ? Colors.white.withOpacity(0.85) : Colors.black.withOpacity(0.8);
      return SizedBox(
        width: 60.0, // Ancho constante para garantizar alineación vertical perfecta
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? theme.accentColor : baseColor,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? theme.accentColor : baseColor,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    }

    return [
      PaneItem(
        icon: buildIcon(FluentIcons.trophy2, 'Torneos', index == 0),
        title: const Text('Torneos'),
        body: Navigator(
          key: _tournamentsNavigatorKey,
          onGenerateRoute: (settings) {
            Widget page;
            if (settings.name == '/') {
              page = const TournamentsPage();
            } else {
              throw Exception('Unknown route: ${settings.name}');
            }
            return NoTransitionPageRoute(child: page, settings: settings);
          },
        ),
      ),
      PaneItem(
        icon: buildIcon(FluentIcons.city_next2, 'Sedes', index == 1),
        title: const Text('Sedes'),
        body: Builder(
          builder: (_) => const HeadquartersPage(),
        ),
      ),
      PaneItem(
        icon: buildIcon(FluentIcons.education, 'Alumnos', index == 2),
        title: const Text('Alumnos'),
        body: Navigator(
          key: _studentsNavigatorKey,
          onGenerateRoute: (settings) {
            Widget page;
            if (settings.name == '/') {
              page = const StudentsPage();
            } else {
              throw Exception('Unknown route: ${settings.name}');
            }
            return NoTransitionPageRoute(child: page, settings: settings);
          },
        ),
      ),
      PaneItem(
        icon: buildIcon(FluentIcons.contact_card, 'Jueces', index == 3),
        title: const Text('Jueces'),
        body: Builder(
          builder: (context) => const JudgesPage(),
        ),
      ),
      PaneItem(
        icon: buildIcon(FluentIcons.people, 'Usuarios', index == 4),
        title: const Text('Usuarios'),
        body: Builder(
          builder: (_) => const UsersPage(),
        ),
      ),
      PaneItem(
        icon: buildIcon(FluentIcons.settings, 'Ajustes', index == 5),
        title: const Text('Ajustes'),
        body: Builder(
          builder: (_) => const SettingsPage(),
        ),
      ),
    ];
  }


  // ============================================================
  // DERECHA — ESTADO DEL SISTEMA (Minimalista)
  // ============================================================
  Widget _buildHeaderRight() {
    final Color syncColor = isCloudSynced
        ? const Color(0xFF1466D1)
        : AppColors.warning;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Sincronización
        _HoverChip(
          icon: FluentIcons.cloud,
          label: isCloudSynced ? 'Sincronizado' : 'Sin sincronizar',
          color: syncColor,
          onTap: () {},
        ),

        const SizedBox(width: 4),

        // Estado de conexión
        const _ConnectionChip(),

        const SizedBox(width: 4),

        // Notificaciones
        _HoverChip(
          icon: FluentIcons.ringer,
          label: 'Alertas',
          onTap: () {
            // TODO: abrir notificaciones
          },
        ),

        const SizedBox(width: 8),
      ],
    );
  }
}

// ============================================================
// WIDGET AUXILIAR: Chip con hover sin bordes
// ============================================================
class _HoverChip extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback onTap;

  const _HoverChip({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  State<_HoverChip> createState() => _HoverChipState();
}

class _HoverChipState extends State<_HoverChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final defaultColor = widget.color ??
        (isDark ? Colors.white.withOpacity(0.75) : Colors.black.withOpacity(0.65));
    final hoverBg = isDark ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.04);

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: _hovered ? hoverBg : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 14, color: defaultColor),
              const SizedBox(width: 5),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 12,
                  color: defaultColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// WIDGET AUXILIAR: Estado de conexión con hover
// ============================================================
class _ConnectionChip extends StatefulWidget {
  const _ConnectionChip();

  @override
  State<_ConnectionChip> createState() => _ConnectionChipState();
}

class _ConnectionChipState extends State<_ConnectionChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final hoverBg = isDark ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.04);

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: _hovered ? hoverBg : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const ConnectionStatus(),
      ),
    );
  }
}
