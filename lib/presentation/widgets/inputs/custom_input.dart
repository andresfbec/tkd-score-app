import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'package:tkd_score/core/theme/theme_provider.dart';
import '../../../core/constants/app.dart';
import './input_type.dart';
import './input_rules.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String? placeholder;
  final bool obscureText;
  final TextEditingController controller;
  final double? width;
  final Widget? prefixIcon;
  final InputType type;

  final String? errorText; // opcional: para mostrar mensajes de error
  final Function(String)? onChanged;

  const CustomInput({
    super.key,
    required this.label,
    required this.type,
    this.placeholder,
    this.obscureText = false,
    required this.controller,
    this.width,
    this.prefixIcon,
    this.errorText,
    this.onChanged,
  });

  /// 🔹 Define el tipo de teclado
  TextInputType _getKeyboardType() {
    switch (type) {
      case InputType.email:
        return TextInputType.emailAddress;

      case InputType.number:
        return TextInputType.number;

      case InputType.phone:
        return TextInputType.phone;

      default:
        return TextInputType.text;
    }
  }

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

      /// 🔹 NUEVO
      keyboardType: _getKeyboardType(),
      inputFormatters: InputRules.getFormatters(type),
      
      onChanged: onChanged,

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

        /// 🔹 MOSTRAR ERROR
        if (errorText != null) ...[
          const SizedBox(height: 6),
          Text(
            errorText!,
            style: const TextStyle(color: AppColors.error, fontSize: 12),
          ),
        ],
      ],
    );
  }
}
