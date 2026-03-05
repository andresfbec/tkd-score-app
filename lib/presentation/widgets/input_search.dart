import 'package:fluent_ui/fluent_ui.dart';

class FluentSearchBox extends StatelessWidget {
  final String placeholder;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;

  const FluentSearchBox({
    super.key,
    required this.placeholder,
    required this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return TextBox(
      placeholder: placeholder,
      expands: false,
      suffix: IconButton(
        icon: const Icon(FluentIcons.search),
        onPressed: () {}, // opcional: acción al presionar el ícono
      ),
      onChanged: onChanged,
    );
  }
}