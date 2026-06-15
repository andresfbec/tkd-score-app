import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../controllers/combat_rounds_controller.dart';
import '../../../controllers/point_types_controller.dart';
import '../../../controllers/combat_events_controller.dart';
import '../../../../domain/entities/point_types_entity.dart';
import '../../../../domain/entities/combat_events_entity.dart';
import 'elegant_split_background.dart';
import 'score_log_footer.dart';
import 'competitor_giant_panel.dart';

class CombatEventScoringPage extends StatefulWidget {
  final int versusId;
  final int roundId;
  final int roundNumber;

  const CombatEventScoringPage({
    super.key,
    required this.versusId,
    required this.roundId,
    required this.roundNumber,
  });

  @override
  State<CombatEventScoringPage> createState() => _CombatEventScoringPageState();
}

class _CombatEventScoringPageState extends State<CombatEventScoringPage> {
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CombatEventsController>().startListening(widget.roundId);
    });
  }

  Future<void> _handleScoreAction(bool isBlue, PointTypesEntity pointType) async {
    try {
      final event = CombatEventsEntity(
        roundId: widget.roundId,
        pointTypeId: pointType.id,
        targetParticipant: isBlue ? 'A' : 'B',
        pointsDelta: pointType.pointsValue.toDouble(),
      );
      await context.read<CombatEventsController>().addEvent(event);
    } catch (e) {
      debugPrint('Error al guardar CombatEvent: $e');
    }
  }

  Future<int?> _showSuperiorityDialog(BuildContext context, String nameA, String nameB, int inscriptionAId, int inscriptionBId) async {
    return await showDialog<int>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Decisión por Superioridad'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'El asalto ha terminado en un empate absoluto después de aplicar todos los criterios de desempate.\n\n'
              'Por favor, los jueces deben votar quién demostró mayor superioridad técnica, combatividad o iniciativa.',
            ),
            const SizedBox(height: 16),
            Text('Seleccione el ganador:', style: FluentTheme.of(context).typography.bodyStrong),
          ],
        ),
        actions: [
          Button(
            child: Text('CHUNG (Azul) - $nameA'),
            onPressed: () => Navigator.pop(context, inscriptionAId),
          ),
          Button(
            child: Text('HONG (Rojo) - $nameB'),
            onPressed: () => Navigator.pop(context, inscriptionBId),
          ),
          FilledButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context, null),
          ),
        ],
      ),
    );
  }

  Future<void> _finalizeRound({
    required CombatRoundsController roundsController,
    required CombatEventsController eventsController,
    required List<PointTypesEntity> pointTypes,
    required RoundScore roundScore,
    required int? inscriptionAId,
    required int? inscriptionBId,
    required String nameA,
    required String nameB,
  }) async {
    if (_submitting) return;
    if (inscriptionAId == null || inscriptionBId == null) return;

    setState(() => _submitting = true);
    try {
      // 1. Determinar el ganador del round
      int? winnerId = roundsController.determineRoundWinner(
        pointsA: roundScore.scoreA.toInt(),
        pointsB: roundScore.scoreB.toInt(),
        inscriptionAId: inscriptionAId,
        inscriptionBId: inscriptionBId,
        events: eventsController.events,
        pointTypes: pointTypes,
      );

      // Si es un empate absoluto, pedir decisión manual por superioridad
      if (winnerId == null) {
        setState(() => _submitting = false); // Habilitar interfaz para el diálogo
        final manualWinnerId = await _showSuperiorityDialog(context, nameA, nameB, inscriptionAId, inscriptionBId);
        if (manualWinnerId == null) {
          // El usuario canceló la decisión
          return;
        }
        winnerId = manualWinnerId;
        setState(() => _submitting = true);
      }

      // 2. Guardar los puntos del round
      await roundsController.updatePoints(
        widget.roundId,
        pointsA: roundScore.scoreA.toInt(),
        pointsB: roundScore.scoreB.toInt(),
      );

      // 3. Registrar el ganador del round
      await roundsController.setWinner(widget.roundId, winnerId);

      // 4. Cambiar estado a completado
      await roundsController.updateState(widget.roundId, 'completed');

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        _showErrors(context, e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  void _showErrors(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          Button(
            child: const Text('Ok'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final roundsController = context.watch<CombatRoundsController>();
    final versus = roundsController.versus;
    final pointTypes = context.watch<PointTypesController>().pointTypes;
    final eventsController = context.watch<CombatEventsController>();

    final nameA = roundsController.competitorAName;
    final nameB = roundsController.competitorBName;

    // Calcular marcador en tiempo real basado en los eventos del controlador
    final roundScore = eventsController.getRoundScore(pointTypes);

    // Calcular logs para cada competidor
    final blueLogs = <ScoreLogEntry>[];
    final redLogs = <ScoreLogEntry>[];
    final pointTypesMap = {for (var pt in pointTypes) pt.id: pt};

    for (final event in eventsController.events.reversed) {
      if (event.isValid != 1) continue;

      final type = pointTypesMap[event.pointTypeId];
      if (type == null) continue;

      final entry = ScoreLogEntry(
        points: type.pointsValue,
        isPenalty: type.isPenalty,
        techniqueName: type.name,
        timestamp: DateTime.now(), // approximation since createdAt isn't in entity
      );

      if (type.isPenalty) {
        if (event.targetParticipant == 'A') {
          redLogs.add(entry);
        } else {
          blueLogs.add(entry);
        }
      } else {
        if (event.targetParticipant == 'A') {
          blueLogs.add(entry);
        } else {
          redLogs.add(entry);
        }
      }
    }

    final displayBlueLogs = blueLogs.take(5).toList();
    final displayRedLogs = redLogs.take(5).toList();

    return ScaffoldPage(
      padding: EdgeInsets.zero,
      content: Stack(
        children: [
          // --- CAPA 1: FONDO DIVIDIDO CON TRANSICIÓN SUAVE ---
          const FluentElegantSplitBackground(),

          // --- CAPA 2: INTERFAZ DE OPERACIÓN ---
          SafeArea(
            child: Column(
              children: [
                _buildHeader(
                  theme,
                  nameA,
                  nameB,
                  roundsController,
                  eventsController,
                  pointTypes,
                  versus?.inscriptionAId,
                  versus?.inscriptionBId,
                  roundScore,
                ),

                const SizedBox(height: 8),

                // Contenedor expandido para los paneles principales
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      // --- LADO CHUNG (AZUL) ---
                      Expanded(
                        child: CompetitorGiantPanel(
                          technicalName: 'CHUNG (청)',
                          competitorName: nameA,
                          isRed: false,
                          score: roundScore.scoreA.toInt(),
                          penalties: roundScore.penaltiesA,
                          pointTypes: pointTypes,
                          onAction: (pointType) => _handleScoreAction(true, pointType),
                        ),
                      ),

                      // Línea divisoria central ultra delgada
                      Container(
                        width: 1,
                        color: theme.resources.surfaceStrokeColorDefault.withOpacity(0.3),
                      ),

                      // --- LADO HONG (ROJO) ---
                      Expanded(
                        child: CompetitorGiantPanel(
                          technicalName: 'HONG (홍)',
                          competitorName: nameB,
                          isRed: true,
                          score: roundScore.scoreB.toInt(),
                          penalties: roundScore.penaltiesB,
                          pointTypes: pointTypes,
                          onAction: (pointType) => _handleScoreAction(false, pointType),
                        ),
                      ),
                    ],
                  ),
                ),

                // --- FOOTER CON LOG DE PUNTOS ---
                ScoreLogFooter(
                  blueLogs: displayBlueLogs,
                  redLogs: displayRedLogs,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
    FluentThemeData theme,
    String nameA,
    String nameB,
    CombatRoundsController roundsController,
    CombatEventsController eventsController,
    List<PointTypesEntity> pointTypes,
    int? inscriptionAId,
    int? inscriptionBId,
    RoundScore roundScore,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withOpacity(0.80),
        border: Border(
          bottom: BorderSide(
            color: theme.resources.surfaceStrokeColorDefault.withOpacity(0.4),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(FluentIcons.back, size: 14),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mesa de Arbitraje Oficial — Round ${widget.roundNumber}',
                    style: theme.typography.bodyStrong?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$nameA vs $nameB',
                    style: theme.typography.caption?.copyWith(
                      color: theme.typography.caption?.color?.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (_submitting)
            const ProgressRing()
          else
            FilledButton(
              child: const Text('Finalizar Round'),
              onPressed: () async {
                if (roundsController.versus == null) return;
                await _finalizeRound(
                  roundsController: roundsController,
                  eventsController: eventsController,
                  pointTypes: pointTypes,
                  roundScore: roundScore,
                  inscriptionAId: inscriptionAId,
                  inscriptionBId: inscriptionBId,
                  nameA: nameA,
                  nameB: nameB,
                );
              },
            ),
        ],
      ),
    );
  }
}