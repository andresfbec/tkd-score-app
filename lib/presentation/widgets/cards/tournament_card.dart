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

  /// Color del acento superior según la fase del torneo.
  Color _accentBarColor(String phase, AccentColor accentColor) {
    final p = TournamentLifecycle.normalize(phase);
    if (p == TournamentLifecycle.live) return const Color(0xFF107C10);
    if (p == TournamentLifecycle.finished) return const Color(0xFF797775);
    if (p == TournamentLifecycle.groupsReady) return const Color(0xFF00B7C3);
    return accentColor;
  }

  /// Color y texto del badge de fase.
  ({Color bg, Color text}) _badgeColors(String phase, bool isDark) {
    final p = TournamentLifecycle.normalize(phase);
    if (p == TournamentLifecycle.live) {
      return isDark
          ? (bg: const Color(0x33107C10), text: const Color(0xFF6CCB5A))
          : (bg: const Color(0x1A107C10), text: const Color(0xFF0B5E0B));
    }
    if (p == TournamentLifecycle.finished) {
      return isDark
          ? (bg: const Color(0x1AFFFFFF), text: const Color(0xFF8A8886))
          : (bg: const Color(0x0F000000), text: const Color(0xFF49443F));
    }
    if (p == TournamentLifecycle.groupsReady) {
      return isDark
          ? (bg: const Color(0x2600B7C3), text: const Color(0xFF4DD0D5))
          : (bg: const Color(0x1A00B7C3), text: const Color(0xFF006D73));
    }
    if (p == TournamentLifecycle.settingsReady) {
      return isDark
          ? (bg: const Color(0x26FF8C00), text: const Color(0xFFFFB74D))
          : (bg: const Color(0x1AFF8C00), text: const Color(0xFFC05800));
    }
    // created
    return isDark
        ? (bg: const Color(0x260078D4), text: const Color(0xFF6CB8F6))
        : (bg: const Color(0x1A0078D4), text: const Color(0xFF0062AD));
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final phase = TournamentLifecycle.normalize(tournament.setupPhase);
    final locked = TournamentLifecycle.isLockedForEditing(tournament.setupPhase);
    final showConfigure = TournamentLifecycle.showConfigureButton(tournament.setupPhase);
    final showStart = TournamentLifecycle.canShowStartButton(
      phase: tournament.setupPhase,
      hasCombatSettings: hasCombatSettings,
      hasGroupsDefined: hasGroupsDefined,
    );

    final accentBarColor = _accentBarColor(tournament.setupPhase, theme.accentColor);
    final badge = _badgeColors(tournament.setupPhase, isDark);

    final cardBg = isDark ? const Color(0xFF2B2B2B) : const Color(0xFFFFFFFF);
    final footerBg = isDark ? const Color(0xFF232323) : const Color(0xFFF5F5F5);
    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : Colors.black.withValues(alpha: 0.08);
    final secondaryTextColor = isDark
        ? Colors.white.withValues(alpha: 0.65)
        : const Color(0xFF605E5C);
    final mutedColor = isDark
        ? Colors.white.withValues(alpha: 0.35)
        : const Color(0xFFA19F9D);
    final lockBg = isDark
        ? Colors.white.withValues(alpha: 0.04)
        : Colors.black.withValues(alpha: 0.04);

    final useSplitButton = phase == TournamentLifecycle.groupsReady &&
        showStart &&
        showConfigure &&
        onStart != null &&
        onConfigure != null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: cardBg,
        border: Border.all(color: borderColor, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Barra de acento superior ──────────────────────────────────
          Container(height: 3, color: accentBarColor),

          // ── Cabecera: título + badge ──────────────────────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: borderColor, width: 0.5),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    tournament.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                  decoration: BoxDecoration(
                    color: badge.bg,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    TournamentLifecycle.labelEs(tournament.setupPhase),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                      color: badge.text,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Cuerpo: metadatos + steps ─────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MetaRow(
                  icon: FluentIcons.p_o_i_solid,
                  text: tournament.location,
                  color: secondaryTextColor,
                  iconColor: accentBarColor,
                ),
                const SizedBox(height: 7),
                _MetaRow(
                  icon: FluentIcons.calendar_agenda,
                  text:
                      '${_formatDate(tournament.dateStart)} → ${_formatDate(tournament.dateEnd)}',
                  color: secondaryTextColor,
                  iconColor: accentBarColor,
                ),
                const SizedBox(height: 7),
                _MetaRow(
                  icon: FluentIcons.shield,
                  text: _disciplineLabel(tournament.discipline),
                  color: secondaryTextColor,
                  iconColor: accentBarColor,
                ),
                const SizedBox(height: 10),

                // Step indicator con etiquetas
                _StepIndicator(
                  currentStep: _getStepIndex(tournament.setupPhase),
                  accentColor: accentBarColor,
                  inactiveColor: isDark
                      ? Colors.white.withValues(alpha: 0.12)
                      : Colors.black.withValues(alpha: 0.10),
                  mutedColor: mutedColor,
                ),

                if (locked)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: lockBg,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(FluentIcons.lock, size: 13, color: mutedColor),
                          const SizedBox(width: 7),
                          Text(
                            phase == TournamentLifecycle.finished
                                ? 'Torneo finalizado'
                                : 'Torneo en curso',
                            style: TextStyle(
                              fontSize: 11.5,
                              fontStyle: FontStyle.italic,
                              color: mutedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const Spacer(),

          // ── Footer: acciones ──────────────────────────────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            decoration: BoxDecoration(
              color: footerBg,
              border: Border(
                top: BorderSide(color: borderColor, width: 0.5),
              ),
            ),
            child: _buildActions(
              context,
              theme: theme,
              isDark: isDark,
              phase: phase,
              locked: locked,
              showConfigure: showConfigure,
              showStart: showStart,
              useSplitButton: useSplitButton,
              accentColor: accentBarColor,
              borderColor: borderColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(
    BuildContext context, {
    required FluentThemeData theme,
    required bool isDark,
    required String phase,
    required bool locked,
    required bool showConfigure,
    required bool showStart,
    required bool useSplitButton,
    required Color accentColor,
    required Color borderColor,
  }) {
    final iconBtnBorder = isDark
        ? Colors.white.withValues(alpha: 0.15)
        : Colors.black.withValues(alpha: 0.15);

    Widget iconButtons = Row(
      children: [
        _IconActionButton(
          icon: FluentIcons.edit,
          onPressed: onEdit,
          borderColor: iconBtnBorder,
        ),
        const SizedBox(width: 5),
        _IconActionButton(
          icon: FluentIcons.delete,
          onPressed: onDelete,
          borderColor: iconBtnBorder,
        ),
      ],
    );

    // Estado: grupos listos → SplitButton (Iniciar + Configurar)
    if (useSplitButton) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconButtons,
          _StartSplitButton(onStart: onStart!, onConfigure: onConfigure!),
        ],
      );
    }

    // Estado: en curso → Continuar (sin editar/borrar)
    if (phase == TournamentLifecycle.live && onManageMatches != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton(
            onPressed: onManageMatches,
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              ),
            ),
            child: const Text('Continuar',
                style: TextStyle(fontSize: 16)),
          ),
        ],
      );
    }

    // Estado: editable con botón Configurar
    if (!locked && showConfigure && onConfigure != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconButtons,
          Button(
            onPressed: onConfigure,
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              ),
              // border: WidgetStateProperty.all(
              //   BorderSide(color: iconBtnBorder),
              // ),
            ),
            child: Text(
              'Configurar',
              style: TextStyle(
                fontSize: 16,
                color: accentColor,
              ),
            ),
          ),
        ],
      );
    }

    // Estado: editable sin acción principal
    if (!locked) {
      return Row(children: [iconButtons]);
    }

    // Estado: bloqueado y sin acción (finished)
    return const SizedBox.shrink();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Widgets auxiliares
// ─────────────────────────────────────────────────────────────────────────────

class _MetaRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;

  const _MetaRow({
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: iconColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.5, color: color),
          ),
        ),
      ],
    );
  }
}

class _IconActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color borderColor;

  const _IconActionButton({
    required this.icon,
    required this.borderColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Button(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          // border: WidgetStateProperty.all(BorderSide(color: borderColor, width: 0.5)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}

class _StartSplitButton extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onConfigure;

  const _StartSplitButton({
    required this.onStart,
    required this.onConfigure,
  });

  @override
  Widget build(BuildContext context) {
    return SplitButton.toggle(
      checked: true,
      onInvoked: onStart,
      flyout: FlyoutContent(
        constraints: const BoxConstraints(maxWidth: 125),
        child: MenuFlyout(
          items: [
            MenuFlyoutItem(
              text: const Text('Configurar'),
              onPressed: () {
                Navigator.of(context).pop();
                onConfigure();
              },
            ),
          ],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
        child: Text(
          'Iniciar',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Color accentColor;
  final Color inactiveColor;
  final Color mutedColor;

  const _StepIndicator({
    required this.currentStep,
    required this.accentColor,
    required this.inactiveColor,
    required this.mutedColor,
    this.totalSteps = 5,
  });

  @override
  Widget build(BuildContext context) {
    final stepNames = [
      'Creado',
      'Config.',
      'Grupos',
      'En curso',
      'Fin',
    ];

    // Dots + lines
    final dotRow = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      final isActive = i <= currentStep;
      dotRow.add(
        Tooltip(
          message: stepNames[i],
          child: Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? accentColor : inactiveColor,
            ),
          ),
        ),
      );
      if (i < totalSteps - 1) {
        dotRow.add(
          Expanded(
            child: Container(
              height: 1.5,
              color: i < currentStep ? accentColor : inactiveColor,
            ),
          ),
        );
      }
    }

    // Labels
    final labelRow = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      final isActive = i <= currentStep;
      labelRow.add(
        Expanded(
          child: Text(
            stepNames[i],
            textAlign: i == 0
                ? TextAlign.left
                : i == totalSteps - 1
                    ? TextAlign.right
                    : TextAlign.center,
            style: TextStyle(
              fontSize: 9.5,
              color: isActive ? accentColor : mutedColor,
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(children: dotRow),
        const SizedBox(height: 4),
        Row(children: labelRow),
      ],
    );
  }
}