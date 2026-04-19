// lib/presentation/widgets/app_shell.dart
import 'package:fluent_ui/fluent_ui.dart';
import '../../core/constants/app.dart';

// ----- WIDGETS -----
import '../widgets/connection_status.dart';
import '../widgets/user_badge.dart';
import '../widgets/calendars/date_badge.dart';
import '../widgets/calendars/tournament_calendar.dart';

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
          children: [
            // Izquierda: UserBadge
            UserBadge(firstName: nombres, lastName: apellidos),

            const SizedBox(width: 20),

            // Centro: DateBadge (expandido y centrado)
            Expanded(
              child: Center(
                child: TournamentCalendar(
                  // Para cuando la pagina de crear el torneo exista pasarle el date
                  //   onDateSelected: (date) {
                  //   Navigator.push(
                  //     context,
                  //     FluentPageRoute(
                  //       builder: (_) => CreateTournamentPage(
                  //         startDate: date,
                  //       ),
                  //     ),
                  //   );

                  // },
                ),
              ),
            ),

            // Derecha: Estado del sistema
            _buildHeaderRight(),
          ],
        ),
        actions: null, // Importante: poner actions en null
      ),
      pane: NavigationPane(
        selected: index,
        onChanged: (i) => setState(() => index = i),
        displayMode: MediaQuery.of(context).size.width < 1200
      ? PaneDisplayMode.top      // cuando la ventana es angosta
      : PaneDisplayMode.auto,
        size: const NavigationPaneSize(openMaxWidth: 200, openMinWidth: 48),
        items: _buildSidebarItems(),
      ),
    );
  }

  // ============================================================
  // ITEMS DEL SIDEBAR/MENÚ
  // ============================================================
  List<NavigationPaneItem> _buildSidebarItems() {
    return [
      PaneItem(
        icon: Icon(FluentIcons.trophy2, size: AppTypography.iconLarge), // 16.0
        title: Text(
          'Torneos',
          style: TextStyle(
            fontSize: AppTypography.titleSmall, // 14.0
            fontWeight: AppTypography.medium, // w500
          ),
        ),
        body: Builder(
          builder: (_) => const TournamentsPage(),
        ),
      ),
      PaneItem(
        icon: Icon(
          FluentIcons.city_next2,
          size: AppTypography.iconLarge,
        ), // 16.0
        title: Text(
          'Sedes',
          style: TextStyle(
            fontSize: AppTypography.titleSmall,
            fontWeight: AppTypography.medium,
          ),
        ),
        body: Builder(
          builder: (_) => const HeadquartersPage(),
        ),
      ),
      PaneItem(
        icon: Icon(
          // FluentIcons.fabric_user_folder,
          FluentIcons.education,
          size: AppTypography.iconLarge,
        ), // 16.0
        title: Text(
          'Alumnos',
          style: TextStyle(
            fontSize: AppTypography.titleSmall,
            fontWeight: AppTypography.medium,
          ),
        ),
        body: Builder(
          builder: (_) => const StudentsPage(),
        ),
      ),
            PaneItem(
        icon: Icon(
          FluentIcons.contact_card,
          size: AppTypography.iconLarge,
        ), // 16.0
        title: Text(
          'Jueces',
          style: TextStyle(
            fontSize: AppTypography.titleSmall,
            fontWeight: AppTypography.medium,
          ),
        ),
        body: Builder(
          builder: (context) => const JudgesPage(),
          ),
      ),
      PaneItem(
        icon: Icon(FluentIcons.people, size: AppTypography.iconLarge), // 16.0
        title: Text(
          'Usuarios',
          style: TextStyle(
            fontSize: AppTypography.titleSmall,
            fontWeight: AppTypography.medium,
          ),
        ),
        body: Builder(
          builder: (_) => const UsersPage(),
        ),
      ),
      PaneItem(
        icon: Icon(FluentIcons.settings, size: AppTypography.iconLarge), // 16.0
        title: Text(
          'Ajustes',
          style: TextStyle(
            fontSize: AppTypography.titleSmall,
            fontWeight: AppTypography.medium,
          ),
        ),
        body: Builder(
          builder: (_) => const SettingsPage(),
        ),
      ),
    ];
  }

  // ============================================================
  // IZQUIERDA — USUARIO
  // ============================================================
  // ============================================================
  // BOTÓN DE USUARIO (HEADER IZQUIERDO) - SOLO ESTO CAMBIA
  // ============================================================
  Widget _buildHeaderLeft() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar con AppColors.info
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.15), // Usando tu constante
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.info.withOpacity(0.4),
                width: 1.5,
              ),
            ),
            child: Center(
              child: Text(
                userName.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  fontSize: AppTypography.bodySmall,
                  fontWeight: AppTypography.bold,
                  color: AppColors.info, // Azul de constantes
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            userName,
            style: TextStyle(
              fontSize: AppTypography.bodySmall,
              fontWeight: AppTypography.semiBold,
              color: Colors.grey[190],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DERECHA — ESTADO DEL SISTEMA
  // ============================================================
  Widget _buildHeaderRight() {
    // Usar AppColors en lugar de Colors.blue
    final Color syncColor = isCloudSynced
        ? const Color.fromARGB(255, 20, 102, 209) // Azul de constantes
        : AppColors.warning; // Naranja de constantes

    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Estado de sincronización
          Icon(
            FluentIcons.cloud,
            size: AppTypography.iconMedium, // 16.0
            color: syncColor,
          ),
          const SizedBox(width: 4),
          Text(
            isCloudSynced ? 'Datos sincronizados' : 'Sin sincronizar',
            style: TextStyle(
              fontSize: AppTypography.caption, // 11.0
              color: syncColor,
              fontWeight: AppTypography.regular,
            ),
          ),

          const SizedBox(width: 12),

          // Widget de conexión
          const ConnectionStatus(),

          const SizedBox(width: 8),

          // Botón de notificaciones
          IconButton(
            icon: Icon(
              FluentIcons.ringer,
              size: AppTypography.bodyMedium, // 16.0
            ),
            onPressed: () {
              // TODO: abrir notificaciones
            },
          ),
        ],
      ),
    );
  }
}
