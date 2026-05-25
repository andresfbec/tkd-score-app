import 'package:fluent_ui/fluent_ui.dart';
import 'dart:math';
import '../../../core/constants/app.dart';
import '../../../domain/entities/groups_entity.dart';
import '../../../domain/entities/inscriptions_entity.dart';

class CombatVisualizationPage extends StatefulWidget {
  final GroupsEntity group;
  final List<InscriptionsEntity> participants;

  const CombatVisualizationPage({
    super.key,
    required this.group,
    required this.participants,
  });

  @override
  State<CombatVisualizationPage> createState() => _CombatVisualizationPageState();
}

class _CombatVisualizationPageState extends State<CombatVisualizationPage> {
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();
  
  late List<BracketRound> rounds;

  @override
  void initState() {
    super.initState();
    _generateBracket();
  }

  void _generateBracket() {
    // 1. Calculate N (Power of 2)
    int pCount = widget.participants.length;
    if (pCount == 0) {
      rounds = [];
      return;
    }
    
    int n = 1;
    while (n < pCount) {
      n *= 2;
    }

    // 2. Prepare participants (Shuffle for randomness as per plan)
    List<InscriptionsEntity?> shuffled = List.from(widget.participants)..shuffle();
    
    // 3. Fill with Byes
    List<InscriptionsEntity?> slots = List.generate(n, (index) {
      if (index < shuffled.length) return shuffled[index];
      return null; // Bye
    });

    // 4. Generate Round 1 Matches
    List<MatchNode> firstRoundMatches = [];
    for (int i = 0; i < n; i += 2) {
      firstRoundMatches.add(MatchNode(
        id: 'R0-M${i ~/ 2}',
        player1: slots[i],
        player2: slots[i + 1],
      ));
    }

    rounds = [BracketRound(roundIndex: 0, title: _getRoundTitle(n, 0), matches: firstRoundMatches)];

    // 5. Generate subsequent rounds (empty for now, just to show the structure)
    int remainingMatches = firstRoundMatches.length ~/ 2;
    int roundIdx = 1;
    while (remainingMatches >= 1) {
      List<MatchNode> roundMatches = List.generate(remainingMatches, (i) => MatchNode(id: 'R$roundIdx-M$i'));
      rounds.add(BracketRound(roundIndex: roundIdx, title: _getRoundTitle(n, roundIdx), matches: roundMatches));
      if (remainingMatches == 1) break;
      remainingMatches ~/= 2;
      roundIdx++;
    }
  }

  String _getRoundTitle(int n, int roundIdx) {
    int totalRounds = (log(n) / log(2)).floor();
    int roundsFromFinal = totalRounds - roundIdx;
    
    if (roundsFromFinal == 1) return 'Final';
    if (roundsFromFinal == 2) return 'Semifinal';
    if (roundsFromFinal == 3) return 'Cuartos';
    if (roundsFromFinal == 4) return 'Octavos';
    return 'Ronda ${roundIdx + 1}';
  }
  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ScaffoldPage(
      header: PageHeader(
        title: Text('Diagrama de Combates - ${widget.group.name}'),
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
        child: rounds.isEmpty 
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
                        roundCount: rounds.length,
                      ),
                      size: Size(rounds.length * 350.0, 1000), 
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: rounds.map((round) {
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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: FluentTheme.of(context).accentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            round.title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1.2,
              color: FluentTheme.of(context).accentColor,
            ),
          ),
        ),
        const SizedBox(height: 32),
        ...List.generate(round.matches.length, (index) {
          final match = round.matches[index];
          double vPadding = 0;
          int roundIndex = round.roundIndex;
          if (roundIndex == 0) vPadding = 10;
          if (roundIndex == 1) vPadding = 75;
          if (roundIndex == 2) vPadding = 205;
          if (roundIndex == 3) vPadding = 465;

          return Padding(
            padding: EdgeInsets.symmetric(vertical: vPadding),
            child: MatchCell(
              roundIndex: roundIndex,
              matchIndex: index,
              isFinal: round.title == 'Final',
              matchNumber: (roundIndex * 10) + index + 1,
              match: match,
            ),
          );
        }),
      ],
    );
  }
}

class BracketRound {
  final int roundIndex;
  final String title;
  final List<MatchNode> matches;

  BracketRound({required this.roundIndex, required this.title, required this.matches});
}

class MatchNode {
  final String id;
  InscriptionsEntity? player1;
  InscriptionsEntity? player2;
  InscriptionsEntity? winner;

  MatchNode({required this.id, this.player1, this.player2, this.winner});
}

class MatchCell extends StatelessWidget {
  final int roundIndex;
  final int matchIndex;
  final bool isFinal;
  final int matchNumber;
  final MatchNode match;

  const MatchCell({
    super.key,
    required this.roundIndex,
    required this.matchIndex,
    this.isFinal = false,
    required this.matchNumber,
    required this.match,
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

  Widget _buildParticipantSlot(BuildContext context, InscriptionsEntity? participant, bool isTop) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final name = participant != null 
        ? '${participant.studentNames ?? ""} ${participant.studentSurnames ?? ""}'
        : 'BYE';
    final school = participant?.headquartersName ?? 'N/A';

    return DragTarget<String>(
      onAccept: (data) {
        // Logic for drag and drop later
      },
      builder: (context, candidateData, rejectedData) {
        return Draggable<String>(
          data: name,
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
                  )
                ],
              ),
              child: Text(
                name,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: candidateData.isNotEmpty
                  ? theme.accentColor.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: isTop
                  ? const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                  : const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
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
                    border: Border.all(color: theme.accentColor.withOpacity(0.2)),
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
                          color: AppColors.getTextSecondary(isDark).withOpacity(0.7),
                          letterSpacing: 0.5,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // Indicators for Bye or Points (visual only)
                if (participant == null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('BYE', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                  )
                else
                  Icon(
                    FluentIcons.gripper_bar_vertical,
                    size: 14,
                    color: AppColors.getTextSecondary(isDark).withOpacity(0.3),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BracketLinesPainter extends CustomPainter {
  final bool isDark;
  final Color accentColor;
  final int roundCount;

  BracketLinesPainter({
    required this.isDark,
    required this.accentColor,
    required this.roundCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = accentColor.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Distances between columns and vertical spacing logic
    const double colWidth = 240.0;
    const double colGap = 100.0;
    
    // Initial round parameters (Octavos example)
    double currentRoundMatchHeight = 140.0; // Total height of a MatchCell roughly
    double currentRoundMatchSpacing = 20.0; // Initial vertical gap
    
    for (int r = 0; r < roundCount - 1; r++) {
      int matchesInThisRound = pow(2, roundCount - 1 - r).toInt();
      int matchesInNextRound = matchesInThisRound ~/ 2;
      
      double xStart = (colWidth + colGap) * r + colWidth;
      double xEnd = xStart + colGap;

      // Base Y position for the first match in this round
      double firstMatchY = 160.0; // Margin top + round title height
      if (r == 1) firstMatchY = 230.0;
      if (r == 2) firstMatchY = 370.0;
      if (r == 3) firstMatchY = 650.0; // Approximations for now

      // Better logic: calculate Y based on the same constants used in _buildRoundColumn
      // Round 0: vPadding 10 -> matchCenter = (10*2 + 120)/2 ? 
      // This is getting complex because of the manual padding in the column.
      // For now, let's stick to the manual hardcoded logic but safe-guarded.
      
      if (r == 0) {
        for (int i = 0; i < 4; i++) {
          double y1 = 160 + (i * 2 * 140.0);
          double y2 = 160 + (i * 2 * 140.0) + 140;
          double targetY = (y1 + y2) / 2;
          _drawConnection(canvas, paint, 240, y1, 340, targetY);
          _drawConnection(canvas, paint, 240, y2, 340, targetY);
        }
      } else if (r == 1 && roundCount > 2) {
        for (int i = 0; i < 2; i++) {
          double y1 = 230 + (i * 2 * 280.0);
          double y2 = 230 + (i * 2 * 280.0) + 280;
          double targetY = (y1 + y2) / 2;
          _drawConnection(canvas, paint, 580, y1, 680, targetY);
          _drawConnection(canvas, paint, 580, y2, 680, targetY);
        }
      } else if (r == 2 && roundCount > 3) {
        double y1f = 370;
        double y2f = 370 + 560;
        double targetYf = (y1f + y2f) / 2;
        _drawConnection(canvas, paint, 920, y1f, 1020, targetYf);
        _drawConnection(canvas, paint, 920, y2f, 1020, targetYf);
      }
    }
  }

  void _drawConnection(Canvas canvas, Paint paint, double x1, double y1, double x2, double y2) {
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
