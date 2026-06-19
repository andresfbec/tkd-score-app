import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../controllers/combat_rounds_controller.dart';
import 'combat_round_scoring/combat_event_scoring_page.dart';

class CombatRoundsExecutionPage extends StatefulWidget {
  final int versusId;
  final int matchNumber;

  const CombatRoundsExecutionPage({
    super.key,
    required this.versusId,
    required this.matchNumber,
  });

  @override
  State<CombatRoundsExecutionPage> createState() => _CombatRoundsExecutionPageState();
}

class _CombatRoundsExecutionPageState extends State<CombatRoundsExecutionPage> {
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCombatRounds();
    });
  }

  Future<void> _initializeCombatRounds() async {
    try {
      final combatRoundsController = context.read<CombatRoundsController>();

      // Inicializa los rounds delegando la lógica al caso de uso de dominio
      await combatRoundsController.initializeCombatRounds(widget.versusId);

      // Iniciar la escucha del Stream de rounds
      combatRoundsController.startListening(widget.versusId);

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CombatRoundsController>(
      builder: (context, roundsController, _) {
        final nameA = roundsController.competitorAName;
        final nameB = roundsController.competitorBName;

        return ScaffoldPage(
          header: PageHeader(
            title: Text(roundsController.isByeMatch
                ? 'Combate #${widget.matchNumber} · $nameA — BYE'
                : 'Combate #${widget.matchNumber} · $nameA vs $nameB'),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: IconButton(
                icon: const Icon(FluentIcons.back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          content: _buildContent(context, roundsController),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, CombatRoundsController outerController) {
    if (_isLoading) {
      return const Center(
        child: ProgressRing(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FluentIcons.error, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error al inicializar los rounds del combate:',
              style: FluentTheme.of(context).typography.subtitle,
            ),
            const SizedBox(height: 8),
            Text(_errorMessage!),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  _errorMessage = null;
                });
                _initializeCombatRounds();
              },
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    return Consumer<CombatRoundsController>(
      builder: (context, controller, child) {
        if (controller.isByeMatch) {
          return _buildByeResolutionView(context, controller);
        }

        final rounds = controller.rounds;
        final executable = controller.executableRound;
        final winnerId = controller.matchWinnerId;
        final nameA = controller.competitorAName;
        final nameB = controller.competitorBName;

        if (rounds.isEmpty) {
          return const Center(
            child: Text('No hay rounds registrados para este combate.'),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Center(
            child: Container(
              // maxWidth: 800,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(FluentIcons.info, size: 32),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$nameA vs $nameB',
                              style: FluentTheme.of(context).typography.bodyStrong,
                            ),
                            const SizedBox(height: 4),
                            Text('Formato: ${controller.combatSettings?.formatType ?? "Cargando..."}'),
                            Text('Rondas: ${controller.combatSettings?.roundsMax ?? "Cargando..."}'),
                            Text('Puntos para ganar: ${controller.combatSettings?.pointsToWin ?? "Cargando..."}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Rounds del Combate',
                    style: FluentTheme.of(context).typography.subtitle,
                  ),
                  const SizedBox(height: 12),
                  ...rounds.map((round) {
                    final isExecutable = executable?.id == round.id;
                    final isCompleted = round.state == 'completed';
                    final isLocked = !isExecutable && !isCompleted;

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Opacity(
                        opacity: isLocked ? 0.5 : 1.0,
                        child: ListTile(
                          leading: isLocked
                              ? const Icon(FluentIcons.lock, size: 20)
                              : (isCompleted
                                  ? Icon(FluentIcons.completed, color: Colors.green, size: 20)
                                  : const Icon(FluentIcons.skype_circle_clock, size: 20)),
                          title: Text(
                            'Round ${round.roundNumber}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: isCompleted
                              ? Text(
                                  'Puntos: ${round.pointsA} ($nameA) - ${round.pointsB} ($nameB)',
                                )
                              : Text('Estado: ${round.state}'),
                          trailing: isExecutable
                              ? FilledButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      FluentPageRoute(
                                        builder: (context) => CombatEventScoringPage(
                                          versusId: widget.versusId,
                                          roundId: round.id!,
                                          roundNumber: round.roundNumber,
                                        ),
                                      ),
                                    ).then((_) {
                                      // Refrescar el stream de rounds al volver de la página de arbitraje
                                      if (mounted) {
                                        context.read<CombatRoundsController>().startListening(widget.versusId);
                                      }
                                    });
                                  },
                                  child: const Text('Ejecutar Combate'),
                                )
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 32),
                  if (winnerId != null) ...[
                    Card(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(FluentIcons.trophy2, color: Colors.yellow, size: 24),
                              const SizedBox(width: 8),
                              Text(
                                'Ganador del Versus Determinado',
                                style: FluentTheme.of(context).typography.bodyStrong,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('ID Ganador: $winnerId'),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () async {
                                await controller.finalizeVersus();
                                if (mounted) {
                                  // Capturamos el Navigator de esta página ANTES de abrir el diálogo.
                                  // El context dentro del builder del diálogo puede resolver
                                  // a un Navigator diferente (el raíz), causando pantalla negra.
                                  final pageNavigator = Navigator.of(context);
                                  showDialog(
                                    context: context,
                                    builder: (dialogContext) => ContentDialog(
                                      title: const Text('Combate Finalizado'),
                                      content: const Text('El resultado del combate ha sido guardado exitosamente.'),
                                      actions: [
                                        Button(
                                          child: const Text('Cerrar'),
                                          onPressed: () {
                                            Navigator.of(dialogContext).pop(); // cierra el diálogo
                                            pageNavigator.pop();               // vuelve al diagrama
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: const Text('Finalizar Versus y Guardar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildByeResolutionView(
    BuildContext context,
    CombatRoundsController controller,
  ) {
    final winnerName = controller.competitorAName;

    return Center(
      child: Card(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(FluentIcons.completed, size: 48, color: Colors.green),
            const SizedBox(height: 16),
            Text(
              'Combate resuelto — BYE',
              style: FluentTheme.of(context).typography.title,
            ),
            const SizedBox(height: 8),
            Text(
              '$winnerName avanza automáticamente a la siguiente ronda.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver al Bracket'),
            ),
          ],
        ),
      ),
    );
  }
}
