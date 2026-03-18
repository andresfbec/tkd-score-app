import 'package:fluent_ui/fluent_ui.dart';

class FluentDropdownFilter extends StatelessWidget {
  final String label;
  final List<String> options;
  final String selected;
  final ValueChanged<String?> onChanged;

  const FluentDropdownFilter({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InfoLabel(
      label: label,
      child: ComboBox<String>(
        isExpanded: true,
        value: selected,
        items: options.map((opt) {
          return ComboBoxItem<String>(
            value: opt,
            child: Text(opt),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}