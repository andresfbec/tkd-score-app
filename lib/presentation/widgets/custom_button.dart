import 'package:fluent_ui/fluent_ui.dart';
import '../../core/constants/app.dart';

class FluentActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool filled; // opcional: para diferenciar botones primarios/secundarios
  final double spacing; // espacio entre ícono y texto

  const FluentActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.filled = false,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: AppTypography.iconMedium), // 16.0
        SizedBox(width: spacing),
        Text(label),
      ],
    );

    return filled
        ? FilledButton(onPressed: onPressed, child: buttonChild)
        : Button(onPressed: onPressed, child: buttonChild);
  }
}
