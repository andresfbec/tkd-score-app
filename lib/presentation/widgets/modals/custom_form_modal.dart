import 'package:fluent_ui/fluent_ui.dart';
import '../inputs/custom_input.dart';
import '../inputs/input_type.dart';

import '../../../core/constants/app.dart';

/// 🔹 CONFIG DE CADA CAMPO
class FormFieldConfig {
  final String name;
  final String label;
  final InputType type;
  final String? placeholder;
  final String? Function(String?)? validator;

  FormFieldConfig({
    required this.name,
    required this.label,
    required this.type,
    this.placeholder,
    this.validator,
  });
}

/// MODAL REUTILIZABLE
class CustomFormModal extends StatefulWidget {
  final String title;
  final List<FormFieldConfig> fields;
  final Map<String, String>? initialValues;
  final Function(Map<String, String>) onSubmit;

  const CustomFormModal({
    super.key,
    required this.title,
    required this.fields,
    required this.onSubmit,
    this.initialValues,
  });

  @override
  State<CustomFormModal> createState() => _CustomFormModalState();
}

class _CustomFormModalState extends State<CustomFormModal> {
  late Map<String, TextEditingController> controllers;
  Map<String, String?> errors = {};

  @override
  void initState() {
    super.initState();

    controllers = {
      for (var field in widget.fields)
        field.name: TextEditingController(
          text: widget.initialValues?[field.name] ?? '',
        ),
    };
  }

  /// 🔹 VALIDACIÓN EN TIEMPO REAL
  void _validateField(FormFieldConfig field, String value) {
    if (field.validator != null) {
      errors[field.name] = field.validator!(value);
    }

    setState(() {});
  }

  /// 🔹 VALIDACIÓN FINAL + SUBMIT
  void _submit() {
    bool isValid = true;

    for (var field in widget.fields) {
      final value = controllers[field.name]!.text;

      if (field.validator != null) {
        final error = field.validator!(value);
        errors[field.name] = error;

        if (error != null) isValid = false;
      }
    }

    setState(() {});

    if (!isValid) return;

    final data = {
      for (var field in widget.fields)
        field.name: controllers[field.name]!.text,
    };

    widget.onSubmit(data);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness.isDark;

    return ContentDialog(
      title: DefaultTextStyle.merge(
        style: const TextStyle(), // 🔥 rompe estilo heredado
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: AppTypography.titleView, // 
                fontWeight: AppTypography.semiBold,
                fontFamily: AppTypography.fontFamily,
                color: AppColors.getTextPrimary(isDark),
              ),
            ),


            const SizedBox(height: 12),

            /// 🔹 Divider estilo Fluent
            Container(
              height: 1,
              color: AppColors.getBorder(isDark),
            ),
          ],
        ),
      ),

      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.fields.map((field) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomInput(
                  label: field.label,
                  type: field.type,
                  controller: controllers[field.name]!,
                  errorText: errors[field.name],
                  onChanged: (value) => _validateField(field, value),
                ),
              );
            }).toList(),
          ),
        ),
      ),

      actions: [
        Button(
          child: const Text("Cancelar"),
          onPressed: () => Navigator.pop(context),
        ),
        FilledButton(
          child: const Text("Guardar"),
          onPressed: _submit,
        ),
      ],
    );
  }
}