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
    return Container(
      width: 60,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(child: _segment(leftColor)),
                Expanded(child: _segment(rightColor)),
              ],
            ),

            // "Nudo" del cinturón (detalle visual clave)
            Center(
              child: Container(
                width: 2,
                height: 10,
                color: (leftColor == Colors.black && rightColor == Colors.black)
                    ? const Color(0xFFFFD700)
                    : Colors.black.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _segment(Color color) {
    final isWhite = color == Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: color,
        border: isWhite
            ? Border.all(color: Colors.grey.withOpacity(0.6), width: 0.5)
            : null,
      ),
    );
  }
}