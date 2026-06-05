import 'package:fluent_ui/fluent_ui.dart';
import '../../../../../core/constants/app.dart';
import '../../../../../domain/entities/inscriptions_entity.dart';
import '../../../../models/combat_bracket_models.dart';
import '../../combat_rounds_execution_page.dart';

class MatchCell extends StatelessWidget {
  final int roundIndex;
  final int matchIndex;
  final bool isFinal;
  final int matchNumber;
  final MatchNode match;
  final bool isLocked;
  final Function(int sourceVersusId, String sourceSlot, int targetVersusId, String targetSlot)? onSwap;

  const MatchCell({
    super.key,
    required this.roundIndex,
    required this.matchIndex,
    this.isFinal = false,
    required this.matchNumber,
    required this.match,
    required this.isLocked,
    this.onSwap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: theme.accentColor.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 4, bottom: 4, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'COMBATE #$matchNumber',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: AppColors.getTextSecondary(isDark),
                    letterSpacing: 0.5,
                  ),
                ),
                if (match.versus.id != null && isLocked)
                  IconButton(
                    icon: Icon(
                      FluentIcons.play,
                      size: 10,
                      color: theme.accentColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        FluentPageRoute(
                          builder: (context) => CombatRoundsExecutionPage(
                            versusId: match.versus.id!,
                            matchNumber: matchNumber,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
          _buildParticipantSlot(context, match.player1, true),
          Container(
            height: 1,
            width: double.infinity,
            color: theme.accentColor.withOpacity(0.05),
          ),
          _buildParticipantSlot(context, match.player2, false),
          if (isFinal)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.accentColor,
                    theme.accentColor.withOpacity(0.7),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FluentIcons.trophy2, size: 14, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'GRAN FINAL',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildParticipantSlot(
    BuildContext context,
    InscriptionsEntity? participant,
    bool isTop,
  ) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final name = participant != null
        ? '${participant.studentNames ?? ""} ${participant.studentSurnames ?? ""}'
        : 'BYE';
    final school = participant?.headquartersName ?? 'N/A';

    final bool isEditable = participant != null && match.versus.roundState == 'draft' && !isLocked;

    final Widget content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: isTop
            ? const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )
            : const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.accentColor.withOpacity(0.2),
                  theme.accentColor.withOpacity(0.05),
                ],
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.accentColor.withOpacity(0.2),
              ),
            ),
            child: Center(
              child: Text(
                name[0],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: theme.accentColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.getTextPrimary(isDark),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  school.toUpperCase(),
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: AppColors.getTextSecondary(
                      isDark,
                    ).withOpacity(0.7),
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (participant == null)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'BYE',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else if (isEditable)
            Icon(
              FluentIcons.gripper_bar_vertical,
              size: 14,
              color: AppColors.getTextSecondary(isDark).withOpacity(0.3),
            ),
        ],
      ),
    );

    if (!isEditable) {
      return content;
    }

    final Map<String, dynamic> dragData = {
      'versusId': match.versus.id,
      'slot': isTop ? 'a' : 'b',
    };

    return DragTarget<Map<String, dynamic>>(
      onAccept: (data) {
        if (onSwap != null) {
          onSwap!(
            data['versusId'] as int,
            data['slot'] as String,
            match.versus.id!,
            isTop ? 'a' : 'b',
          );
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Draggable<Map<String, dynamic>>(
          data: dragData,
          feedback: DefaultTextStyle(
            style: TextStyle(
              color: AppColors.getTextPrimary(isDark),
              fontFamily: AppTypography.fontFamily,
            ),
            child: Container(
              width: 240,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.accentColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: candidateData.isNotEmpty
                  ? theme.accentColor.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: isTop
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
            ),
            child: content,
          ),
        );
      },
    );
  }
}
