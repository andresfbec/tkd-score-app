import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:tkd_score/core/theme/theme_provider.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String? placeholder;
  final bool obscureText;
  final TextEditingController controller;

  const CustomInput({
    super.key,
    required this.label,
    this.placeholder,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    final labelColor = themeProvider.isDarkMode
        ? Colors.white.withOpacity(0.9)
        : Colors.black.withOpacity(0.8);

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
        TextBox(
          placeholder: placeholder ?? '',
          obscureText: obscureText,
          controller: controller,
        ),
      ],
    );
  }
}