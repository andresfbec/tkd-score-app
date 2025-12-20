import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:tkd_score/core/theme/theme_provider.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String? placeholder;
  final bool obscureText;
  final TextEditingController controller;
  final double? width; // 👈 nuevo parámetro opcional

  const CustomInput({
    super.key,
    required this.label,
    this.placeholder,
    this.obscureText = false,
    required this.controller,
    this.width, // 👈 inicialización
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    final labelColor = themeProvider.isDarkMode
        ? Colors.white.withOpacity(0.9)
        : Colors.black.withOpacity(0.8);

    final input = TextBox(
      placeholder: placeholder ?? '',
      obscureText: obscureText,
      controller: controller,
      decoration: WidgetStateProperty.all(
        BoxDecoration(
          // Color translúcido en vez de blanco sólido
          color: themeProvider.isDarkMode
              ? Colors.white.withOpacity(0.35)
              : Colors.white.withOpacity(0.35),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: themeProvider.isDarkMode
                ? Colors.white.withOpacity(0.15)
                : Colors.black.withOpacity(0.12),
            width: 1,
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        width != null
            ? SizedBox(width: width, child: input) // 👈 control de ancho
            : input,
      ],
    );
  }
}