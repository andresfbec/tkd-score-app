import 'package:fluent_ui/fluent_ui.dart';

class CombatRoundsExecutionPage extends StatelessWidget {
  final int versusId;
  final int matchNumber;

  const CombatRoundsExecutionPage({
    super.key,
    required this.versusId,
    required this.matchNumber,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(
        title: Text('Ejecución de Combate #$matchNumber'),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: IconButton(
            icon: const Icon(FluentIcons.back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(FluentIcons.play, size: 48),
            const SizedBox(height: 16),
            Text(
              'Versus ID: $versusId',
              style: FluentTheme.of(context).typography.subtitle,
            ),
            const SizedBox(height: 8),
            const Text('Pantalla de ejecución de rounds (En desarrollo)'),
          ],
        ),
      ),
    );
  }
}
