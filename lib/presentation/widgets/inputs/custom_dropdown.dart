import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:tkd_score/core/theme/theme_provider.dart';
import '../../../core/constants/app.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<ComboBoxItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String? placeholder;
  final double? width;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.placeholder,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final labelColor = isDark ? Colors.white.withOpacity(0.9) : Colors.black.withOpacity(0.8);

    final dropdown = ComboBox<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      placeholder: Text(placeholder ?? 'Seleccione una opción'),
      isExpanded: true, // Para que ocupe todo el ancho del SizedBox
    );

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
        SizedBox(width: width ?? double.infinity, child: dropdown),
      ],
    );
  }
}