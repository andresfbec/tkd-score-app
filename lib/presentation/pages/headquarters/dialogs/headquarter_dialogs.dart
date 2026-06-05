import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../../core/enums/input_type.dart';
import '../../../../core/utils/notifications.dart';
import '../../../controllers/headquarters_controller.dart';
import '../../../forms/validators.dart';
import '../../../widgets/modals/custom_form_modal.dart';

/// Muestra el diálogo para crear una nueva sede.
void showCreateHeadquarterModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) => CustomFormModal(
      title: "Crear nueva sede",
      fields: [
        FormFieldConfig(
          name: "name",
          label: "Nombre",
          type: InputType.name,
          validator: (v) => FormValidations.required(v, field: "Nombre"),
        ),
        FormFieldConfig(
          name: "address",
          label: "Dirección",
          type: InputType.text,
          validator: (v) => FormValidations.required(v, field: "Dirección"),
        ),
        FormFieldConfig(
          name: "city",
          label: "Ciudad",
          type: InputType.name,
          validator: (v) => FormValidations.required(v, field: "Ciudad"),
        ),
        FormFieldConfig(
          name: "master",
          label: "Responsable",
          type: InputType.name,
          validator: (v) => FormValidations.required(v, field: "Responsable"),
        ),
        FormFieldConfig(
          name: "phone",
          label: "Teléfono",
          type: InputType.phone,
          validator: FormValidations.validatePhone,
        ),
      ],
      onSubmit: (data) async {
        try {
          await context.read<HeadquartersController>().createHeadquarter(
            name: data["name"] ?? '',
            address: data["address"] ?? '',
            city: data["city"] ?? '',
            master: data["master"] ?? '',
            phone: data["phone"] ?? '',
          );
        } catch (e) {
          debugPrint("Error creando sede: $e");
        }
      },
    ),
  );
}

/// Muestra el diálogo para editar una sede existente.
void showEditHeadquarterModal(BuildContext context, Map<String, dynamic> row) {
  showDialog(
    context: context,
    builder: (dialogContext) => CustomFormModal(
      title: "Editar sede",
      initialValues: {
        "name": row["name"],
        "address": row["address"],
        "city": row["city"],
        "master": row["master"],
        "phone": row["phoneNumber"],
      },
      fields: [
        FormFieldConfig(
          name: "name",
          label: "Nombre",
          type: InputType.name,
          validator: (v) => FormValidations.required(v, field: "Nombre"),
        ),
        FormFieldConfig(
          name: "address",
          label: "Dirección",
          type: InputType.text,
          validator: (v) => FormValidations.required(v, field: "Dirección"),
        ),
        FormFieldConfig(
          name: "city",
          label: "Ciudad",
          type: InputType.name,
          validator: (v) => FormValidations.required(v, field: "Ciudad"),
        ),
        FormFieldConfig(
          name: "master",
          label: "Responsable",
          type: InputType.name,
          validator: (v) => FormValidations.required(v, field: "Responsable"),
        ),
        FormFieldConfig(
          name: "phone",
          label: "Teléfono",
          type: InputType.phone,
          validator: FormValidations.validatePhone,
        ),
      ],
      onSubmit: (data) async {
        try {
          await context.read<HeadquartersController>().updateHeadquarter(
            id: row["id"],
            name: data["name"] ?? '',
            address: data["address"] ?? '',
            city: data["city"] ?? '',
            master: data["master"] ?? '',
            phone: data["phone"] ?? '',
          );
        } catch (e) {
          debugPrint("Error actualizando sede: $e");
        }
      },
    ),
  );
}

/// Muestra el diálogo de confirmación para eliminar una sede.
void showDeleteHeadquarterDialog(BuildContext context, Map<String, dynamic> row) {
  showDialog(
    context: context,
    builder: (dialogContext) => ContentDialog(
      title: const Text('Confirmar eliminación'),
      content: Text(
        '¿Estás seguro de que deseas eliminar la sede ${row['name']}?',
      ),
      actions: [
        Button(
          child: const Text('Cancelar'),
          onPressed: () => Navigator.pop(dialogContext),
        ),
        Button(
          onPressed: () async {
            try {
              await context
                  .read<HeadquartersController>()
                  .deleteHeadquarter(row["id"]);
              Navigator.pop(dialogContext);
            } catch (e) {
              Navigator.pop(dialogContext);
              debugPrint("Error eliminando sede: $e");
            }
          },
          style: ButtonStyle(
            backgroundColor: ButtonState.all(Colors.red),
            foregroundColor: ButtonState.all(Colors.white),
          ),
          child: const Text('Eliminar'),
        ),
      ],
    ),
  );
}
