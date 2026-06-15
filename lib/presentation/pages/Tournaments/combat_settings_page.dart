import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app.dart';
import '../../../core/utils/status_handler.dart';
import '../../../domain/entities/tournament_entity.dart';
import '../../controllers/combat_settings_controller.dart';
import 'tournament_configuration/groups/groups_tournament.dart';
import 'tournament_configuration/inscriptions_tournament.dart';
import 'tournament_configuration/settings_tournament.dart';

class CombatSettingsPage extends StatefulWidget {
  final TournamentEntity tournament;

  const CombatSettingsPage({super.key, required this.tournament});

  @override
  State<CombatSettingsPage> createState() => _CombatSettingsPageState();
}

class _CombatSettingsPageState extends State<CombatSettingsPage> {
  int _currentIndex = 0;
  int? _hoveredIndex;
  late final PageController _pageController;

  static const _tabs = ['Reglas', 'Inscripciones', 'Grupos'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final controller = context.watch<CombatSettingsController>();
    handleStatus(context, controller);

    return ScaffoldPage(
      header: PageHeader(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: AppTypography.titleView,
              color: isDark ? Colors.white : Colors.black,
              fontFamily: 'Segoe UI',
            ),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.alias,
                    child: Text(
                      'Torneos',
                      style: TextStyle(
                        fontSize: AppTypography.titleView,
                        fontWeight: AppTypography.semiBold,
                        fontFamily: AppTypography.fontFamily,
                        color: AppColors.getTextPrimary(isDark),
                      ),
                    ),
                  ),
                ),
              ),
              const TextSpan(text: '  >  '),
              TextSpan(
                // text: 'Configuración: ${widget.tournament.name}',
                text: 'Gestión de torneo',
                style: TextStyle(
                  fontSize: AppTypography.titleView,
                  fontWeight: AppTypography.semiBold,
                  fontFamily: AppTypography.fontFamily,
                  color: AppColors.getTextPrimary(isDark),
                ),
              ),
            ],
          ),
        ),
      ),
      content: Column(
        children: [
          // ── Tab bar personalizado ─────────────────────────────────────
// ── Tab bar minimalista con Nombre de Torneo a la derecha ─────────────────────
Padding(
  padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 0, bottom: 0), // Ajustado padding derecho a 25.0 para simetría
  child: Row(
    children: [
      // Bloque de pestañas (Reglas, Inscripciones, Grupos)
      ...List.generate(_tabs.length, (i) {
        final isSelected = _currentIndex == i;
        final isHovered = _hoveredIndex == i;

        return GestureDetector(
          onTap: () => _onTabTapped(i),
          child: MouseRegion(
            cursor: SystemMouseCursors.basic, 
            onEnter: (_) => setState(() => _hoveredIndex = i), 
            onExit: (_) => setState(() => _hoveredIndex = null), 
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected
                        ? theme.accentColor
                        : (isHovered 
                            ? theme.accentColor.withOpacity(0.3) 
                            : Colors.transparent),
                    width: 2.5,
                  ),
                ),
              ),
              child: Text(
                _tabs[i],
                style: TextStyle(
                  fontSize: AppTypography.titleMedium,
                  fontWeight: isSelected ? AppTypography.semiBold : AppTypography.regular,
                  color: isSelected
                      ? theme.accentColor
                      : (isHovered
                          ? AppColors.getTextPrimary(isDark).withOpacity(0.5)
                          : AppColors.getTextSecondary(isDark).withOpacity(0.6)),
                ),
              ),
            ),
          ),
        );
      }),

      // ── El Spacer empuja todo lo que viene después al extremo derecho ──
      const Spacer(),

      // ── Nombre del Torneo alineado a la derecha ─────────────────────────
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8), // Mismo padding vertical para alinear la línea base del texto
        child: Text(
          widget.tournament.name, // Accede directamente al objeto del torneo pasado a la página
          style: TextStyle(
            fontSize: AppTypography.titleLarge, // Mismo tamaño para mantener armonía visual
            fontWeight: AppTypography.medium,  // Regular o semiBold según prefieras
            fontFamily: AppTypography.fontFamily,
            color: AppColors.getTextPrimary(isDark).withOpacity(0.8), // Un poco más suave que el título principal
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // Si el nombre es muy largo, añade '...' para no romper el diseño
        ),
      ),
    ],
  ),
),

          // ── Divider sutil ──────────────────────────────────────────────
          Divider(
            style: DividerThemeData(
              thickness: 1,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withOpacity(0.08)
                    : Colors.black.withOpacity(0.08),
              ),
            ),
          ),

          // ── Contenido animado con PageView ────────────────────────────
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(), // Solo navegamos por tab tap
              onPageChanged: (index) {
                if (_currentIndex != index) {
                  setState(() => _currentIndex = index);
                }
              },
              children: [
                SettingsTournament(tournament: widget.tournament),
                InscriptionsTournament(tournament: widget.tournament),
                GroupsTournament(tournament: widget.tournament),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
