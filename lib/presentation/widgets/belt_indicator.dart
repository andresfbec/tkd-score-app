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

    return Container(
      width: 70,
      height: 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.15)
              : Colors.black.withOpacity(0.15),
        ),
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