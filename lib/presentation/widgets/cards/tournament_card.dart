import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/constants/tournament_lifecycle.dart';
import '../../../domain/entities/tournament_entity.dart';

/// Tarjeta de torneo (Fluent / estilo Windows). Acciones según [TournamentLifecycle].
class TournamentCard extends StatelessWidget {
  final TournamentEntity tournament;
  final bool hasCombatSettings;
  final bool hasGroupsDefined;

  final VoidCallback? onConfigure;
  final VoidCallback? onStart;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const TournamentCard({
    super.key,
    required this.tournament,
    this.hasCombatSettings = false,
    this.hasGroupsDefined = false,
    this.onConfigure,
    this.onStart,
    this.onEdit,
    this.onDelete,
  });

  String _formatDate(DateTime d) {
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  String _disciplineLabel(String d) {
    switch (d) {
      case 'combat':
        return 'Combate';
      case 'poomsae':
        return 'Poomsae';
      default:
        return d;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final phase = TournamentLifecycle.normalize(tournament.setupPhase);
    final locked = TournamentLifecycle.isLockedForEditing(tournament.setupPhase);
    final showConfigure = TournamentLifecycle.showConfigureButton(
      tournament.setupPhase,
    );
    final showStart = TournamentLifecycle.canShowStartButton(
      phase: tournament.setupPhase,
      hasCombatSettings: hasCombatSettings,
      hasGroupsDefined: hasGroupsDefined,
    );

    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.black.withValues(alpha: 0.06);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF9F9F9),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  tournament.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
              if (!locked) ...[
                IconButton(
                  icon: const Icon(FluentIcons.edit, size: 16),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(FluentIcons.delete, size: 16),
                  onPressed: onDelete,
                ),
              ],
            ],
          ),
          const SizedBox(height: 6),
          Text(
            tournament.location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: isDark
                  ? Colors.white.withValues(alpha: 0.72)
                  : Colors.black.withValues(alpha: 0.65),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${_formatDate(tournament.dateStart)} → ${_formatDate(tournament.dateEnd)}',
            style: TextStyle(
              fontSize: 11,
              color: isDark
                  ? Colors.white.withValues(alpha: 0.55)
                  : Colors.black.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                FluentIcons.info,
                size: 14,
                color: theme.accentColor,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  TournamentLifecycle.labelEs(tournament.setupPhase),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: theme.accentColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            _disciplineLabel(tournament.discipline),
            style: TextStyle(
              fontSize: 11,
              color: isDark
                  ? Colors.white.withValues(alpha: 0.45)
                  : Colors.black.withValues(alpha: 0.45),
            ),
          ),
          const Spacer(),
          if (!locked && (showConfigure || showStart)) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.end,
              children: [
                if (showConfigure && onConfigure != null)
                  FilledButton(
                    onPressed: onConfigure,
                    child: const Text('Configurar'),
                  ),
                if (showStart && onStart != null)
                  Button(
                    onPressed: onStart,
                    child: const Text('Iniciar torneo'),
                  ),
              ],
            ),
          ],
          if (locked)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                phase == TournamentLifecycle.finished
                    ? 'Torneo finalizado'
                    : 'Torneo en curso — edición deshabilitada',
                style: TextStyle(
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.5)
                      : Colors.black.withValues(alpha: 0.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
