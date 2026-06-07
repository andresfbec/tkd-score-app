import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../controllers/combat_rounds_controller.dart';

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
  int _pointsA = 0;
  int _pointsB = 0;
  bool _submitting = false;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CombatRoundsController>();
    final versus = controller.versus;

    final nameA = "Competidor Azul (Inscripción #${versus?.inscriptionAId})";
    final nameB = "Competidor Rojo (Inscripción #${versus?.inscriptionBId})";

    return ScaffoldPage(
      header: PageHeader(
        title: Text('Scoring - Round ${widget.roundNumber}'),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: IconButton(
            icon: const Icon(FluentIcons.back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      content: Center(
        child: Container(
          // maxWidth: 600,
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Registro de Puntuación del Round',
                    style: FluentTheme.of(context).typography.subtitle,
                  ),
                  const SizedBox(height: 24),
                  // Competitor A Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          nameA,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(FluentIcons.line_chart),
                            onPressed: () {
                              if (_pointsA > 0) setState(() => _pointsA--);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              '$_pointsA',
                              style: FluentTheme.of(context).typography.title,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(FluentIcons.add),
                            onPressed: () {
                              setState(() => _pointsA++);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Competitor B Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          nameB,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(FluentIcons.line_chart),
                            onPressed: () {
                              if (_pointsB > 0) setState(() => _pointsB--);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              '$_pointsB',
                              style: FluentTheme.of(context).typography.title,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(FluentIcons.add),
                            onPressed: () {
                              setState(() => _pointsB++);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  if (_submitting)
                    const ProgressRing()
                  else
                    FilledButton(
                      onPressed: () async {
                        if (versus == null) return;
                        setState(() => _submitting = true);
                        try {
                          // 1. Guardar los puntos del round
                          await controller.updatePoints(widget.roundId, pointsA: _pointsA, pointsB: _pointsB);
                          
                          // 2. Determinar el ganador del round (lógica de negocio delegada a dominio)
                          final winnerId = controller.determineRoundWinner(
                            pointsA: _pointsA,
                            pointsB: _pointsB,
                            inscriptionAId: versus.inscriptionAId,
                            inscriptionBId: versus.inscriptionBId,
                          );
                          
                          if (winnerId != null) {
                            await controller.setWinner(widget.roundId, winnerId);
                          }

                          // 3. Cambiar estado a completado
                          await controller.updateState(widget.roundId, 'completed');
                          
                          if (mounted) {
                            Navigator.pop(context);
                          }
                        } catch (e) {
                          if (mounted) {
                            showErrors(context, e.toString());
                          }
                        } finally {
                          if (mounted) {
                            setState(() => _submitting = false);
                          }
                        }
                      },
                      child: const Text('Finalizar Round y Declarar Ganador'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showErrors(BuildContext context, String message) {
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
}

