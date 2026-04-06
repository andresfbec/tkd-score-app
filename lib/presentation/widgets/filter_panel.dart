import 'package:fluent_ui/fluent_ui.dart';

// widget para filtros de students (aun en construccion, solo estructura base)

class FilterPanel extends StatelessWidget {
  final VoidCallback onClose;
  final List<Widget> children; // Aquí meterás tus Checkboxes/ComboBoxes después

  const FilterPanel({
    super.key, 
    required this.onClose,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Ancho estándar de paneles en Windows
      decoration: BoxDecoration(
        color: FluentTheme.of(context).micaBackgroundColor,
        border: Border(
          left: BorderSide(
            color: FluentTheme.of(context).activeColor, 
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          // CABECERA
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filtros', style: FluentTheme.of(context).typography.subtitle),
                IconButton(
                  icon: const Icon(FluentIcons.chrome_close, size: 12),
                  onPressed: onClose,
                ),
              ],
            ),
          ),
          const Divider(),
          
          // CUERPO (Donde irán los filtros)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: children,
            ),
          ),
          
          const Divider(),
          
          // PIE (Botón de acción)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                child: const Text('Aplicar Filtros'),
                onPressed: () {
                  // Aquí disparas tu evento de Bloc o Provider
                  onClose();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}