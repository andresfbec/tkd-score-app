import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:tkd_score/core/theme/theme_provider.dart';
import '../../core/constants/app.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String? placeholder;
  final bool obscureText;
  final TextEditingController controller;
  final double? width;
  final Widget? prefixIcon;

  const CustomInput({
    super.key,
    required this.label,
    this.placeholder,
    this.obscureText = false,
    required this.controller,
    this.width,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    final isDark = themeProvider.isDarkMode;

    final labelColor = isDark
        ? Colors.white.withOpacity(0.9)
        : Colors.black.withOpacity(0.8);

    final borderColor = isDark
        ? Colors.white.withOpacity(0.15)
        : Colors.black.withOpacity(0.12);

    final input = TextBox(
      controller: controller,
      placeholder: placeholder ?? '',
      obscureText: obscureText,

      // 🔹 ESTILO TEXTO ESCRITO
      style: TextStyle(
        fontSize: AppTypography.bodyMedium,
        fontWeight: AppTypography.regular,
        color: isDark ? Colors.white : Colors.black,
      ),

      // 🔹 ESTILO PLACEHOLDER
      placeholderStyle: TextStyle(
        fontSize: AppTypography.bodyMedium,
        fontWeight: AppTypography.regular,
        color: isDark
            ? Colors.white.withOpacity(0.5)
            : Colors.black.withOpacity(0.45),
      ),

      prefix: prefixIcon != null
          ? Padding(
              padding: const EdgeInsets.only(left: 10, right: 6),
              child: IconTheme(
                data: IconThemeData(
                  size: AppTypography.iconMedium,
                  color: isDark
                      ? Colors.white.withOpacity(0.7)
                      : Colors.black.withOpacity(0.6),
                ),
                child: prefixIcon!,
              ),
            )
          : null,

      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),

      decoration: WidgetStateProperty.resolveWith((states) {
        final isFocused = states.contains(WidgetState.focused);
        final isHovering = states.contains(WidgetState.hovered);

        return BoxDecoration(
          color: isDark
              ? Colors.white.withOpacity(0.05)
              : Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isFocused
                ? FluentTheme.of(context).accentColor
                : isHovering
                    ? borderColor.withOpacity(0.8)
                    : borderColor,
            width: isFocused ? 1.4 : 1,
          ),
        );
      }),
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
        width != null ? SizedBox(width: width, child: input) : input,
      ],
    );
  }
}
