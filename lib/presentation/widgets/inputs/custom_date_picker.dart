import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app.dart';
import '../../../core/theme/theme_provider.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final DateTime selected;
  final ValueChanged<DateTime> onChanged;
  final double? width;

  const CustomDatePicker({
    super.key,
    required this.label,
    required this.selected,
    required this.onChanged,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final labelColor = isDark
        ? Colors.white.withOpacity(0.9)
        : Colors.black.withOpacity(0.8);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontSize: AppTypography.titleSmall,
            fontWeight: AppTypography.semiBold,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: width ?? 300,
          child: DatePicker(selected: selected, onChanged: onChanged),
        ),
      ],
    );
  }
}
