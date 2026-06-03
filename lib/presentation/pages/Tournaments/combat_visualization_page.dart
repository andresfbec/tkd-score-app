import 'package:fluent_ui/fluent_ui.dart';
import '../../../core/constants/app.dart';
import '../../../domain/entities/inscriptions_entity.dart';
import '../../../core/config/containers/dependency_versus.dart';
import '../../../core/config/containers/dependency_inscriptions.dart';
import '../../controllers/combat_visualization_controller.dart';
import '../../models/combat_bracket_models.dart';

class CombatVisualizationPage extends StatefulWidget {
  final int groupId;
  final int tournamentId;
  final String groupName;

  const CombatVisualizationPage({
    super.key,
    required this.groupId,
    required this.tournamentId,
    required this.groupName,
  });

  @override
  State<CombatVisualizationPage> createState() =>
      _CombatVisualizationPageState();
}

class _CombatVisualizationPageState extends State<CombatVisualizationPage> {
  late final CombatVisualizationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CombatVisualizationController(
      InjectionVersus().generateGroupBracket,
      InjectionInscriptions().inscriptionsRepository,
      InjectionVersus().swapVersusParticipants,
    );
    _controller.addListener(() => setState(() {}));
    _controller.loadBracket(widget.groupId, widget.tournamentId);
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.loading) {
      return const ScaffoldPage(
        content: Center(child: ProgressRing()),
      );
    }

    if (_controller.versus == null) {
      return const ScaffoldPage(
        content: Center(child: Text('Sin datos')),
      );
    }

    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ScaffoldPage(
      header: PageHeader(
        title: Text('Diagrama de Combates - ${widget.groupName}'),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: IconButton(
            icon: const Icon(FluentIcons.back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        commandBar: CommandBar(
          mainAxisAlignment: MainAxisAlignment.end,
          primaryItems: [
            CommandBarButton(
              icon: const Icon(FluentIcons.save),
              label: const Text('Guardar Llaves'),
              onPressed: () {},
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.play),
              label: const Text('Confirmar Ronda'),
              onPressed: () {},
            ),
          ],
        ),
      ),
      content: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        ),
        child: _controller.rounds.isEmpty
            ? const Center(child: Text('No hay participantes en este grupo.'))
            : Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: BracketGridPainter(isDark: isDark),
                    ),
                  ),
                  InteractiveViewer(
                    constrained: false,
                    boundaryMargin: const EdgeInsets.all(100),
                    minScale: 0.1,
                    maxScale: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Stack(
                        children: [
                          CustomPaint(
                            painter: BracketLinesPainter(
                              isDark: isDark,
                              accentColor: theme.accentColor,
                              rounds: _controller.rounds,
                            ),
                            size: Size(_controller.rounds.length * 350.0, 1000),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _controller.rounds.map((round) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 100.0),
                                child: _buildRoundColumn(round),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildRoundColumn(BracketRound round) {
    final theme = FluentTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: theme.accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: theme.accentColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              round.name.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: theme.accentColor,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
        ...round.matches.map((match) {
          final isFinal = round.roundIndex == _controller.rounds.length;
          final roundIdx = round.roundIndex - 1;

          double topPadding = 10.0;
          double bottomPadding = 10.0;

          if (roundIdx == 1) {
            topPadding = 80.0;
            bottomPadding = 80.0;
          } else if (roundIdx == 2) {
            topPadding = 220.0;
            bottomPadding = 220.0;
          } else if (roundIdx >= 3) {
            topPadding = 500.0;
            bottomPadding = 500.0;
          }

          return Padding(
            padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
            child: MatchCell(
              roundIndex: round.roundIndex,
              matchIndex: match.matchNumber,
              isFinal: isFinal,
              matchNumber: match.matchNumber,
              match: match,
              onSwap: (sourceVersusId, sourceSlot, targetVersusId, targetSlot) {
                _controller.swapParticipants(
                  versusIdA: sourceVersusId,
                  slotA: sourceSlot,
                  versusIdB: targetVersusId,
                  slotB: targetSlot,
                  groupId: widget.groupId,
                  tournamentId: widget.tournamentId,
                );
              },
            ),
          );
        }),
      ],
    );
  }
}

class MatchCell extends StatelessWidget {
  final int roundIndex;
  final int matchIndex;
  final bool isFinal;
  final int matchNumber;
  final MatchNode match;
  final Function(int sourceVersusId, String sourceSlot, int targetVersusId, String targetSlot)? onSwap;

  const MatchCell({
    super.key,
    required this.roundIndex,
    required this.matchIndex,
    this.isFinal = false,
    required this.matchNumber,
    required this.match,
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
            padding: const EdgeInsets.only(left: 12, top: 8, bottom: 4),
            child: Text(
              'COMBATE #$matchNumber',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: AppColors.getTextSecondary(isDark),
                letterSpacing: 0.5,
              ),
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

    final bool isEditable = participant != null && match.versus.roundState == 'draft';

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
          // Rank/Seed or Avatar placeholder
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

class BracketLinesPainter extends CustomPainter {
  final bool isDark;
  final Color accentColor;
  final List<BracketRound> rounds;

  BracketLinesPainter({
    required this.isDark,
    required this.accentColor,
    required this.rounds,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = accentColor.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const double colWidth = 240.0;
    const double colGap = 100.0;

    for (int r = 0; r < rounds.length - 1; r++) {
      final currentRound = rounds[r];
      final nextRound = rounds[r + 1];

      final double xStart = (colWidth + colGap) * r + colWidth;
      final double xEnd = xStart + colGap;

      for (int i = 0; i < nextRound.matches.length; i++) {
        // Enlazar los dos combates correspondientes de la ronda actual
        final int childIdx1 = i * 2;
        final int childIdx2 = i * 2 + 1;

        if (childIdx1 < currentRound.matches.length) {
          final double y1 = _getYCenter(r, childIdx1);
          final double yTarget = _getYCenter(r + 1, i);
          _drawConnection(canvas, paint, xStart, y1, xEnd, yTarget);
        }

        if (childIdx2 < currentRound.matches.length) {
          final double y2 = _getYCenter(r, childIdx2);
          final double yTarget = _getYCenter(r + 1, i);
          _drawConnection(canvas, paint, xStart, y2, xEnd, yTarget);
        }
      }
    }
  }

  double _getYCenter(int roundIdx, int matchIdx) {
    const double titleHeight = 54.0;
    const double cellHeight = 118.0;

    double padding = 10.0;
    if (roundIdx == 1) {
      padding = 80.0;
    } else if (roundIdx == 2) {
      padding = 220.0;
    } else if (roundIdx >= 3) {
      padding = 500.0;
    }

    final double blockHeight = cellHeight + 2 * padding;
    return titleHeight + matchIdx * blockHeight + padding + (cellHeight / 2);
  }

  void _drawConnection(
    Canvas canvas,
    Paint paint,
    double x1,
    double y1,
    double x2,
    double y2,
  ) {
    final path = Path();
    path.moveTo(x1, y1);
    double midX = x1 + (x2 - x1) / 2;
    path.lineTo(midX, y1);
    path.lineTo(midX, y2);
    path.lineTo(x2, y2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BracketGridPainter extends CustomPainter {
  final bool isDark;

  BracketGridPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (isDark ? Colors.white : Colors.black).withOpacity(0.03)
      ..strokeWidth = 1.0;

    const spacing = 40.0;
    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
