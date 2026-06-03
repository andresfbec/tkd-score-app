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
  final VoidCallback? onManageMatches;

  const TournamentCard({
    super.key,
    required this.tournament,
    this.hasCombatSettings = false,
    this.hasGroupsDefined = false,
    this.onConfigure,
    this.onStart,
    this.onEdit,
    this.onDelete,
    this.onManageMatches,
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
    if (p == TournamentLifecycle.groupsReady) return 2;
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

    // Condición exacta para usar nuestro botón unificado (SplitButton)
    final useSplitButton = phase == TournamentLifecycle.groupsReady &&
        showStart &&
        showConfigure &&
        onStart != null &&
        onConfigure != null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF9F9F9),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con el título modificado y sin la línea inferior
          Container(
            decoration: BoxDecoration(
              color: headerBgColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              // CORRECCIÓN: Se eliminó el parámetro 'border' que dibujaba la línea divisoria
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    tournament.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500, // Un poco más grueso para balancear el tamaño
                      fontSize: 19,               // Aumentado de 16 a 19 para mayor jerarquía
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.accentColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    TournamentLifecycle.labelEs(tournament.setupPhase),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                        FluentIcons.p_o_i_solid,
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
                        FluentIcons.calendar_agenda,
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
                      Icon(FluentIcons.shield, size: 16, color: theme.accentColor),
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
                  
                  // SECCIÓN DE BOTONES OPTIMIZADA
                  if (useSplitButton) ...[
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(FluentIcons.edit, size: 18),
                              onPressed: onEdit,
                            ),
                            const SizedBox(width: 4),
                            IconButton(
                              icon: const Icon(FluentIcons.delete, size: 18),
                              onPressed: onDelete,
                            ),
                          ],
                        ),
                        _StartDropdownButton(
                          onStart: onStart!,
                          onConfigure: onConfigure!,
                        ),
                      ],
                    ),
                  ] else if (!locked || phase == TournamentLifecycle.live) ...[
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (!locked) ...[
                              IconButton(
                                icon: const Icon(FluentIcons.edit, size: 16),
                                onPressed: onEdit,
                              ),
                              const SizedBox(width: 4),
                              IconButton(
                                icon: const Icon(FluentIcons.delete, size: 16),
                                onPressed: onDelete,
                              ),
                            ],
                          ],
                        ),
                        if (phase == TournamentLifecycle.live && onManageMatches != null)
                          FilledButton(
                            onPressed: onManageMatches,
                            child: const Text('Continuar'),
                          )
                        else if (showConfigure && onConfigure != null)
                          FilledButton(
                            onPressed: onConfigure,
                            child: const Text('Configurar'),
                          ),
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

class _StartDropdownButton extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onConfigure;

  const _StartDropdownButton({
    required this.onStart,
    required this.onConfigure,
  });

  @override
  Widget build(BuildContext context) {
    return SplitButton.toggle(
      checked: true,
      onInvoked: onStart,
      flyout: FlyoutContent(
        constraints: const BoxConstraints(maxWidth: 125), // Ajustado previamente a 170
        child: MenuFlyout(
          items: [
            MenuFlyoutItem(
              // leading: const Icon(FluentIcons.settings, size: 14),
              text: const Text('Configurar'),
              onPressed: () {
                Navigator.of(context).pop();
                onConfigure();
              },
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: const Text(
          'Iniciar',
        ),
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