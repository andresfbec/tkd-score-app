import 'package:fluent_ui/fluent_ui.dart';
import '../../../domain/entities/students_entity.dart';
import '../../../core/enums/input_type.dart';
import '../../../core/config/containers/dependency_headquarters.dart';
import '../../../core/config/containers/dependency_belts.dart';
import '../../widgets/modals/custom_form_modal.dart';

void showCreateStudentModal(
  BuildContext context, {
  required Function(StudentsEntity) onSave,
}) async {
  // 1. Cargamos los datos externos para los Dropdowns
  final hqs = await InjectionHeadquarters().headquartersRepository.getAll();
  final belts = await InjectionBelts().beltsRepository.getAll();

  if (!context.mounted) return;

  showDialog(
    context: context,
    builder: (context) {
      return CustomFormModal(
        title: "Registrar Nuevo Estudiante",
        fields: [
          FormFieldConfig(
            name: 'names',
            label: 'Nombres',
            type: InputType.text,
            placeholder: 'Ej. Juan Camilo',
            validator: (v) =>
                v!.isEmpty ? 'Los nombres son obligatorios' : null,
          ),
          FormFieldConfig(
            name: 'surnames',
            label: 'Apellidos',
            type: InputType.text,
            placeholder: 'Ej. Pérez Rojas',
            validator: (v) =>
                v!.isEmpty ? 'Los apellidos son obligatorios' : null,
          ),
          FormFieldConfig(
            name: 'numberIdentify',
            label: 'Número de Documento',
            type: InputType.text,
            placeholder: 'CC / TI / Registro Civil',
            validator: (v) => v!.isEmpty ? 'El documento es necesario' : null,
          ),
          FormFieldConfig(
            name: 'birthDate',
            label: 'Fecha de Nacimiento',
            type: InputType.date, // Asegúrate de que CustomInput maneje el DatePicker o un formato de texto
            placeholder: 'YYYY-MM-DD',
            validator: (v) {
              if (v!.isEmpty) return 'Campo obligatorio';
              if (DateTime.tryParse(v) == null)
                return 'Formato inválido (AAAA-MM-DD)';
              return null;
            },
          ),
          FormFieldConfig(
            name: 'gender',
            label: 'Género',
            type: InputType.dropdown,
            options: [
              {'value': 'M', 'label': 'Masculino'},
              {'value': 'F', 'label': 'Femenino'},
              {'value': 'O', 'label': 'Otro'},
            ],
            validator: (v) => v!.isEmpty ? 'Seleccione género' : null,
          ),
          FormFieldConfig(
            name: 'weightKg',
            label: 'Peso actual (kg)',
            type: InputType.number,
            placeholder: '0.0',
            validator: (v) => double.tryParse(v ?? '') == null
                ? 'Ingrese un número válido'
                : null,
          ),
          FormFieldConfig(
            name: 'heightCm',
            label: 'Estatura (cm)',
            type: InputType.number,
            placeholder: 'Ej. 175',
            validator: (v) => int.tryParse(v ?? '') == null
                ? 'Ingrese un número válido'
                : null,
          ),
          FormFieldConfig(
            name: 'headquarterId',
            label: 'Sede de entrenamiento',
            type: InputType.dropdown,
            options: hqs
                .map((h) => {'value': h.id.toString(), 'label': h.name})
                .toList(),
            validator: (v) => v!.isEmpty ? 'Seleccione una sede' : null,
          ),
          FormFieldConfig(
            name: 'beltId',
            label: 'Cinturón actual',
            type: InputType.dropdown,
            options: belts
                .map((b) => {'value': b.id.toString(), 'label': b.name})
                .toList(),
            validator: (v) => v!.isEmpty ? 'Seleccione un cinturón' : null,
          ),
        ],
        onSubmit: (data) {
          // 2. Transformamos el Map en la Entidad
          final student = StudentsEntity(
            id: null, // Es autoincrementable en DB
            names: data['names']!,
            surnames: data['surnames']!,
            typeIdentify:
                'CC', // Podrías añadir un dropdown para esto si quieres
            numberIdentify: data['numberIdentify']!,
            birthDate: DateTime.parse(data['birthDate']!),
            gender: data['gender']!,
            weightKg: double.parse(data['weightKg']!),
            heightCm: double.parse(data['heightCm']!),
            headquarterId: int.parse(data['headquarterId']!),
            beltId: int.parse(data['beltId']!),
            tournamentWins: 0,
            participations: 0,
          );

          onSave(student);
        },
      );
    },
  );
}
