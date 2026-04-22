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

  int _getStepIndex(String phase) {
    final p = TournamentLifecycle.normalize(phase);
    if (p == TournamentLifecycle.created) return 0;
    if (p == TournamentLifecycle.settingsReady) return 1;
    if (p == TournamentLifecycle.groupsReady || p == TournamentLifecycle.readyToStart) return 2;
    if (p == TournamentLifecycle.live) return 3;
    if (p == TournamentLifecycle.finished) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final phase = TournamentLifecycle.normalize(tournament.setupPhase);
    final locked = TournamentLifecycle.isLockedForEditing(
      tournament.setupPhase,
    );
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
    final headerBgColor = isDark
        ? Colors.white.withValues(alpha: 0.03)
        : Colors.black.withValues(alpha: 0.02);
    final secondaryTextColor = isDark
        ? Colors.white.withValues(alpha: 0.65)
        : Colors.black.withValues(alpha: 0.65);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF9F9F9),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con el título
          Container(
            decoration: BoxDecoration(
              color: headerBgColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              border: Border(bottom: BorderSide(color: borderColor)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    tournament.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
          ),
          // Contenido principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ubicación
                  Row(
                    children: [
                      Icon(
                        FluentIcons.location,
                        size: 16,
                        color: theme.accentColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          tournament.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            color: secondaryTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Fechas
                  Row(
                    children: [
                      Icon(
                        FluentIcons.calendar,
                        size: 16,
                        color: theme.accentColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${_formatDate(tournament.dateStart)} → ${_formatDate(tournament.dateEnd)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            color: secondaryTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Disciplina
                  Row(
                    children: [
                      Icon(FluentIcons.event, size: 16, color: theme.accentColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _disciplineLabel(tournament.discipline),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            color: secondaryTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Estado
                  Row(
                    children: [
                      Icon(FluentIcons.info, size: 16, color: theme.accentColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          TournamentLifecycle.labelEs(tournament.setupPhase),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: theme.accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _StepIndicator(
                    currentStep: _getStepIndex(tournament.setupPhase),
                  ),
                  if (locked)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Icon(
                            FluentIcons.lock,
                            size: 16,
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.4)
                                : Colors.black.withValues(alpha: 0.3),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              phase == TournamentLifecycle.finished
                                  ? 'Torneo finalizado'
                                  : 'Torneo en curso',
                              style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: isDark
                                    ? Colors.white.withValues(alpha: 0.5)
                                    : Colors.black.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const Spacer(),
                  if (!locked && (showConfigure || showStart)) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        if (showConfigure && onConfigure != null)
                          Expanded(
                            child: FilledButton(
                              onPressed: onConfigure,
                              child: const Text('Configurar'),
                            ),
                          ),
                        if (showStart && onStart != null) ...[
                          const SizedBox(width: 8),
                          Expanded(
                            child: Button(
                              onPressed: onStart,
                              child: const Text('Iniciar'),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const _StepIndicator({required this.currentStep, this.totalSteps = 5});

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final inactiveColor = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.black.withValues(alpha: 0.1);
    final activeColor = theme.accentColor;

    final stepNames = [
      'Creado',
      'Configuración definida',
      'Grupos definidos',
      'En ejecución',
      'Finalizado'
    ];

    List<Widget> children = [];
    for (int i = 0; i < totalSteps; i++) {
      final isActive = i <= currentStep;
      final isLast = i == totalSteps - 1;

      // Dot
      children.add(
        Tooltip(
          message: stepNames[i],
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? activeColor : inactiveColor,
            ),
          ),
        ),
      );

      // Line
      if (!isLast) {
        final isLineActive = i < currentStep;
        children.add(
          Expanded(
            child: Container(
              height: 2,
              color: isLineActive ? activeColor : inactiveColor,
            ),
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(children: children),
    );
  }
}
