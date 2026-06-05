import 'package:fluent_ui/fluent_ui.dart';
import '../../../../core/constants/app.dart';
import '../../../../core/config/containers/dependency_versus.dart';
import '../../../../core/config/containers/dependency_inscriptions.dart';
import '../../../controllers/combat_visualization_controller.dart';
import '../../../models/combat_bracket_models.dart';
import '../../../../core/utils/notifications.dart';
import 'widgets/bracket_grid_painter.dart';
import 'widgets/match_cell.dart';

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
      InjectionVersus().updateVersusRoundState,
      InjectionVersus().advanceRoundWinners,
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

    CommandBarButton? confirmButton;
    if (_controller.rounds.isNotEmpty) {
      final unconfirmedRounds = _controller.rounds.where(
        (r) => r.state != 'confirmed',
      );

      final allConfirmed = unconfirmedRounds.isEmpty;
      final nextRound = allConfirmed ? _controller.rounds.first : unconfirmedRounds.first;

      final isReadyToConfirm = allConfirmed || nextRound.matches.any((m) => m.player1 != null || m.player2 != null);
      final isDisable = allConfirmed || !isReadyToConfirm;

      confirmButton = CommandBarButton(
        icon: Icon(allConfirmed ? FluentIcons.completed : FluentIcons.accept),
        label: Text(allConfirmed 
            ? 'Todo Confirmado' 
            : 'Confirmar enfrentamientos (${nextRound.name})'),
        onPressed: isDisable
            ? null
            : () {
                showDialog(
                  context: context,
                  builder: (context) => ContentDialog(
                    title: const Text('Confirmar enfrentamientos'),
                    content: const Text(
                      'Advertencia: Después de confirmar los enfrentamientos de esta ronda, no se podrán editar.',
                    ),
                    actions: [
                      Button(
                        child: const Text('Cancelar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      FilledButton(
                        child: const Text('Confirmar'),
                        onPressed: () {
                          Navigator.pop(context);
                          _controller.confirmRound(
                            groupId: widget.groupId,
                            bracketRound: nextRound.roundIndex,
                            tournamentId: widget.tournamentId,
                          );
                          AppNotifications.showSuccess(
                            context,
                            'Los enfrentamientos de "${nextRound.name}" han sido confirmados y bloqueados.',
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
      );
    }

    CommandBarButton? advanceButton;
    if (_controller.rounds.isNotEmpty) {
      BracketRound? roundToAdvance;
      for (int i = 0; i < _controller.rounds.length - 1; i++) {
        final r = _controller.rounds[i];
        final nextR = _controller.rounds[i + 1];
        if (r.state == 'confirmed') {
          final nextEmpty = nextR.matches.every((m) => m.player1 == null && m.player2 == null);
          if (nextEmpty) {
            roundToAdvance = r;
            break;
          }
        }
      }

      if (roundToAdvance != null) {
        final allCompleted = roundToAdvance.matches.isNotEmpty &&
            roundToAdvance.matches.every((m) => m.winner != null || m.versus.state == 'completed');

        advanceButton = CommandBarButton(
          icon: const Icon(FluentIcons.generate),
          label: Text('Generar siguiente ronda (${roundToAdvance.name})'),
          onPressed: !allCompleted
              ? null
              : () async {
                  await _controller.advanceWinners(
                    groupId: widget.groupId,
                    currentRound: roundToAdvance!.roundIndex,
                    tournamentId: widget.tournamentId,
                  );
                  AppNotifications.showSuccess(
                    context,
                    'Se han generado los enfrentamientos de la siguiente ronda.',
                  );
                },
        );
      }
    }

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
            if (confirmButton != null) confirmButton,
            if (advanceButton != null) advanceButton,
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _controller.rounds.map((round) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 100.0),
                            child: _buildRoundColumn(round),
                          );
                        }).toList(),
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
              isLocked: round.state == 'confirmed',
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
