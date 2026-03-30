import 'package:fluent_ui/fluent_ui.dart';

class BeltIndicator extends StatelessWidget {
  final Color leftColor;
  final Color rightColor;

  const BeltIndicator({
    super.key,
    required this.leftColor,
    required this.rightColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = FluentTheme.of(context).brightness == Brightness.dark;

    // Lógica para el color del borde
    Color borderColor;
    if (leftColor == Colors.black && rightColor == Colors.black) {
      borderColor = const Color.fromARGB(255, 255, 217, 0); // Dorado
    } else {
      borderColor = const Color.fromARGB(255, 128, 128, 128); // Negro por defecto
    }

    return Container(
      width: 70,
      height: 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Row(
          children: [
            Expanded(child: Container(color: leftColor)),
            Expanded(child: Container(color: rightColor)),
          ],
        ),
      ),
    );
  }
}