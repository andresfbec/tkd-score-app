import 'package:fluent_ui/fluent_ui.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;

  const CustomInput({
    super.key,
    required this.label,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextBox(
      placeholder: label,
      obscureText: obscureText,
      controller: controller
    );
  }
}
