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
                text: 'Configuración de Torneo ${widget.tournament.name}',
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
      content: TabView(
        currentIndex: _currentIndex,
        onChanged: (index) => setState(() => _currentIndex = index),
        tabWidthBehavior: TabWidthBehavior.equal,
        closeButtonVisibility: CloseButtonVisibilityMode.never,
        tabs: [
          Tab(
            text: Text(
              'Reglas',
              style: TextStyle(
                fontSize: AppTypography.titleMedium,
                fontWeight: _currentIndex == 0 ? AppTypography.semiBold : AppTypography.regular,
                color: _currentIndex == 0 ? theme.accentColor : AppColors.getTextSecondary(isDark),
              ),
            ),
            body: SettingsTournament(tournament: widget.tournament),
          ),
          Tab(
            text: Text(
              'Inscripciones',
              style: TextStyle(
                fontSize: AppTypography.titleMedium,
                fontWeight: _currentIndex == 1 ? AppTypography.semiBold : AppTypography.regular,
                color: _currentIndex == 1 ? theme.accentColor : AppColors.getTextSecondary(isDark),
              ),
            ),
            body: InscriptionsTournament(tournament: widget.tournament),
          ),
          Tab(
            text: Text(
              'Grupos',
              style: TextStyle(
                fontSize: AppTypography.titleMedium,
                fontWeight: _currentIndex == 2 ? AppTypography.semiBold : AppTypography.regular,
                color: _currentIndex == 2 ? theme.accentColor : AppColors.getTextSecondary(isDark),
              ),
            ),
            body: GroupsTournament(tournament: widget.tournament),
          ),
        ],
      ),
    );
  }
}
