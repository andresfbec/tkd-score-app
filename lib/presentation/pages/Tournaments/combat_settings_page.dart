import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app.dart';
import '../../../core/utils/status_handler.dart';
import '../../../domain/entities/tournament_entity.dart';
import '../../controllers/combat_settings_controller.dart';
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
                text: 'Configurar: ${widget.tournament.name}',
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
        tabs: [
          Tab(
            text: const Text('Configuración'),
            body: SettingsTournament(tournament: widget.tournament),
          ),
          Tab(
            text: const Text('Grupos'),
            body: const Center(
              child: Text('Grupos en construcción', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
