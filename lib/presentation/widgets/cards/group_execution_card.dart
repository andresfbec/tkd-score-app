import 'package:fluent_ui/fluent_ui.dart';
import '../../../domain/entities/groups_entity.dart';
import '../../../domain/entities/inscriptions_entity.dart';
import '../../../core/utils/format_date.dart';

class GroupExecutionCard extends StatelessWidget {
  final GroupsEntity group;
  final List<InscriptionsEntity> participants;
  final VoidCallback onExecuteMatches;

  const GroupExecutionCard({
    super.key,
    required this.group,
    required this.participants,
    required this.onExecuteMatches,
  });

  void _showParticipantsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          constraints: const BoxConstraints(
            minWidth: 400,
            maxWidth: 600,
            maxHeight: 600,
          ),
          title: Text(
            'Participantes — ${group.name}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: participants.isEmpty
              ? const Text('No hay participantes asignados a este grupo.')
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: participants.length,
                  itemBuilder: (context, index) {
                    return _ParticipantTile(inscription: participants[index]);
                  },
                ),
          actions: [
            Button(
              child: const Text('Cerrar'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final cardBg = isDark ? const Color(0xFF2B2B2B) : const Color(0xFFFFFFFF);
    final footerBg = isDark ? const Color(0xFF232323) : const Color(0xFFF5F5F5);
    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : Colors.black.withValues(alpha: 0.08);
    final secondaryColor = isDark
        ? Colors.white.withValues(alpha: 0.60)
        : const Color(0xFF605E5C);
    final mutedColor = isDark
        ? Colors.white.withValues(alpha: 0.35)
        : const Color(0xFFA19F9D);
    final chipBg = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.black.withValues(alpha: 0.05);
    final labelColor = isDark
        ? Colors.white.withValues(alpha: 0.40)
        : const Color(0xFF8A8886);

    final bool canExecute = participants.length >= 2;

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(8),
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
          // ── Barra de acento superior ────────────────────────────────
          Container(height: 3, color: theme.accentColor),

          // ── Cabecera: nombre del grupo + botón participantes ─────────
          Container(
            padding: const EdgeInsets.fromLTRB(14, 10, 10, 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: borderColor, width: 0.5),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    group.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                Tooltip(
                  message: 'Ver participantes',
                  child: Button(
                    onPressed: () => _showParticipantsModal(context),
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(chipBg),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FluentIcons.group,
                          size: 18,
                          color: theme.accentColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${participants.length}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: theme.accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Cuerpo: metadata con títulos ────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MetaField(
                  icon: FluentIcons.tag,
                  label: 'Género',
                  value: group.gender == 'mixed'
                      ? 'Mixto'
                      : group.gender == 'male'
                          ? 'Masculino'
                          : 'Femenino',
                  labelColor: labelColor,
                  accentColor: theme.accentColor,
                  textColor: secondaryColor,
                ),
                const SizedBox(height: 5),
                _MetaField(
                  icon: FluentIcons.date_time_mirrored,
                  label: 'Edad',
                  value: '${group.ageMin ?? 0} – ${group.ageMax ?? 99} años',
                  labelColor: labelColor,
                  accentColor: theme.accentColor,
                  textColor: secondaryColor,
                ),
                const SizedBox(height: 5),
                _MetaField(
                  icon: FluentIcons.scale_volume,
                  label: 'Peso',
                  value: '${group.weightMin ?? 0} – ${group.weightMax ?? 999} kg',
                  labelColor: labelColor,
                  accentColor: theme.accentColor,
                  textColor: secondaryColor,
                ),
                const SizedBox(height: 5),
                _MetaField(
                  icon: FluentIcons.ribbon,
                  label: 'Cinturón',
                  value: '${group.beltFromId ?? 0} – ${group.beltToId ?? 999}',
                  labelColor: labelColor,
                  accentColor: theme.accentColor,
                  textColor: secondaryColor,
                ),
              ],
            ),
          ),

          const Spacer(),

          // ── Footer: advertencia o acción ────────────────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
            decoration: BoxDecoration(
              color: footerBg,
              border: Border(
                top: BorderSide(color: borderColor, width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!canExecute)
                  Row(
                    children: [
                      Icon(FluentIcons.warning, size: 14, color: mutedColor),
                      const SizedBox(width: 6),
                      Text(
                        'Mínimo 2 participantes',
                        style: TextStyle(
                          fontSize: 11.5,
                          color: mutedColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  )
                else
                  const SizedBox.shrink(),
                FilledButton(
                  onPressed: canExecute ? onExecuteMatches : null,
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    ),
                  ),
                  child: const Text(
                    'Ver combates',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Campo de metadato con ícono, título y valor
// ─────────────────────────────────────────────────────────────────────────────

class _MetaField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color labelColor;
  final Color accentColor;
  final Color textColor;

  const _MetaField({
    required this.icon,
    required this.label,
    required this.value,
    required this.labelColor,
    required this.accentColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: accentColor),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: labelColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tile de participante en el modal
// ─────────────────────────────────────────────────────────────────────────────

class _ParticipantTile extends StatelessWidget {
  final InscriptionsEntity inscription;

  const _ParticipantTile({required this.inscription});

  @override
  Widget build(BuildContext context) {
    final age = inscription.studentBirthDate != null
        ? DateHelper.calculateAge(inscription.studentBirthDate!)
        : 0;

    return ListTile(
      leading: const Icon(FluentIcons.contact),
      title: Text(
        '${inscription.studentNames ?? ""} ${inscription.studentSurnames ?? ""}',
      ),
      subtitle: Text(
        'Sede: ${inscription.headquartersName ?? "N/A"} · '
        'Edad: $age · '
        'Peso: ${inscription.studentWeight ?? 0} kg · '
        'Cinturón: ${inscription.studentBeltName ?? "N/A"}',
      ),
    );
  }
}