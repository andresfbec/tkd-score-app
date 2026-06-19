import 'package:fluent_ui/fluent_ui.dart';

/// Fondo con transición suave y elegante (difuminado más delgado, sin blanco)
class FluentElegantSplitBackground extends StatelessWidget {
  const FluentElegantSplitBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = FluentTheme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        // Lado Azul (Chung)
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.blue.normal.withOpacity(0.35),
                  Colors.blue.normal.withOpacity(0.12),
                  isDarkMode
                      ? Colors.blue.normal.withOpacity(0.02)
                      : Colors.blue.normal.withOpacity(0.01),
                ],
                stops: const [0.0, 0.92, 1.0], // Transición más ajustada
              ),
            ),
          ),
        ),
        // Línea central sutil (casi imperceptible)
        Container(
          width: 0.5,
          color: isDarkMode
              ? Colors.white.withOpacity(0.03)
              : Colors.black.withOpacity(0.02),
        ),
        // Lado Rojo (Hong)
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Colors.red.normal.withOpacity(0.35),
                  Colors.red.normal.withOpacity(0.12),
                  isDarkMode
                      ? Colors.red.normal.withOpacity(0.02)
                      : Colors.red.normal.withOpacity(0.01),
                ],
                stops: const [0.0, 0.92, 1.0], // Transición más ajustada
              ),
            ),
          ),
        ),
      ],
    );
  }
}
