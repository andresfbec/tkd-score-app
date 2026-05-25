import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app.dart';
import '../../../core/utils/status_handler.dart';
import '../../../domain/entities/tournament_entity.dart';
import '../../controllers/combat_settings_controller.dart';
import 'groups_tournament.dart';
import 'inscriptions_tournament.dart';
import 'settings_tournament.dart';

class CombatSettingsPage extends StatefulWidget {
  final TournamentEntity tournament;

  const CombatSettingsPage({super.key, required this.tournament});

  @override
  State<CombatSettingsPage> createState() => _CombatSettingsPageState();
}

class _CombatSettingsPageState extends State<CombatSettingsPage> {
  int _currentIndex = 0;
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
                text: 'Configuración: ${widget.tournament.name}',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Row(
              children: List.generate(_tabs.length, (i) {
                final isSelected = _currentIndex == i;
                return GestureDetector(
                  onTap: () => _onTabTapped(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.accentColor.withOpacity(0.12)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected ? theme.accentColor : Colors.transparent,
                          width: 2,
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
                            : AppColors.getTextSecondary(isDark),
                      ),
                    ),
                  ),
                );
              }),
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
