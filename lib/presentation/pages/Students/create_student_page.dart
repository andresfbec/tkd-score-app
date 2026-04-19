import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

// Widgets de entrada personalizados
import '../../widgets/inputs/custom_input.dart';
import '../../widgets/inputs/custom_dropdown.dart';
import '../../widgets/inputs/custom_date_picker.dart';

// Lógica y Dominio
import '../../../domain/entities/students_entity.dart';
import '../../controllers/students_controller.dart';
import '../../controllers/headquarters_controller.dart';
import '../../forms/validators.dart';
import '../../../core/enums/input_type.dart';
import '../../../core/constants/app.dart';
import '../../../core/constants/student_form_options.dart';

class StudentFormPage extends StatefulWidget {
  final int? initialHeadquarterId;

  const StudentFormPage({super.key, this.initialHeadquarterId});

  @override
  State<StudentFormPage> createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final _namesController = TextEditingController();
  final _surnamesController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  // Estados de selección
  DateTime _birthDate = DateTime.now().subtract(const Duration(days: 365 * 10));
  String _gender = 'Masculino';
  int? _selectedHqId;
  int? _selectedBeltId;
  String _typeIdentify = 'CC';

  @override
  void initState() {
    super.initState();
    _selectedHqId = widget.initialHeadquarterId;
  }

  @override
  Widget build(BuildContext context) {
    final hqController = context.watch<HeadquartersController>();
    final theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return ScaffoldPage.scrollable(
      header: PageHeader(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: AppTypography.titleView,
              color: isDark ? Colors.white : Colors.black,
              fontFamily: 'Segoe UI',
            ),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.alias,
                    child: Text(
                      'Alumnos',
                      style: TextStyle(
                      fontSize: AppTypography.titleView,
                      fontWeight: AppTypography.semiBold,
                      fontFamily: AppTypography.fontFamily,
                      color: AppColors.getTextPrimary(isDark),
                    ),
                    ),
                  ),
                ),
              ),
              const TextSpan(text: '  >  '),
               TextSpan(
                text: 'Crear Alumno',
                style: TextStyle(
                fontSize: AppTypography.titleView,
                fontWeight: AppTypography.semiBold,
                fontFamily: AppTypography.fontFamily,
                color: AppColors.getTextPrimary(isDark),
              ),
              ),
            ],
          ),
        ),
      ),
      children: [
        const SizedBox(height: 10),
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  _buildSectionTitle('Información Básica'),
                  const SizedBox(height: 20),
                  
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      CustomInput(
                        width: 360,
                        label: 'Nombres Completos',
                        type: InputType.name,
                        controller: _namesController,
                        placeholder: 'Escriba los nombres',
                        validator: FormValidations.validateName,
                      ),
                      CustomInput(
                        width: 360,
                        label: 'Apellidos Completos',
                        type: InputType.name,
                        controller: _surnamesController,
                        placeholder: 'Escriba los apellidos',
                        validator: (v) => FormValidations.required(v, field: 'Apellidos'),
                      ),
                      CustomDatePicker(
                        width: 360,
                        label: 'Fecha de Nacimiento',
                        selected: _birthDate,
                        onChanged: (v) => setState(() => _birthDate = v),
                      ),
                      CustomDropdown<String>(
                        width: 360,
                        label: 'Género',
                        value: _gender,
                        items: const [
                          ComboBoxItem(value: 'Masculino', child: Text('Masculino')),
                          ComboBoxItem(value: 'Femenino', child: Text('Femenino')),
                        ],
                        onChanged: (v) => setState(() => _gender = v!),
                      ),
                    ],
                  ),

                  const SizedBox(height: 45),
                  _buildSectionTitle('Detalles Técnicos y Físicos'),
                  const SizedBox(height: 20),

                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      CustomDropdown<String>(
                      width: 250, // Un poco más angosto que los demás
                      label: 'Tipo Doc.',
                      value: _typeIdentify,
                      items: StudentFormOptions.identifyTypes.map((item) {
                        return ComboBoxItem(
                          value: item['value']!,
                          child: Text(item['label']!),
                        );
                      }).toList(),
                      onChanged: (v) => setState(() => _typeIdentify = v!),
                    ),
                      CustomInput(
                        width: 230,
                        label: 'Número de Documento',
                        type: InputType.number,
                        controller: _idNumberController,
                        validator: (v) => FormValidations.required(v, field: 'Documento'),
                      ),
                      CustomDropdown<int>(
                        width: 230,
                        label: 'Sede de Entrenamiento',
                        value: _selectedHqId,
                        placeholder: 'Seleccione Sede',
                        items: hqController.headquarters.map((h) {
                          return ComboBoxItem<int>(value: h.id, child: Text(h.name));
                        }).toList(),
                        onChanged: (v) => setState(() => _selectedHqId = v),
                      ),
                      CustomDropdown<int>(
                        width: 230,
                        label: 'Cinturón / Grado Actual',
                        value: _selectedBeltId,
                        placeholder: 'Seleccione Grado',
                        items: StudentFormOptions.belts.map((b) {
                          return ComboBoxItem<int>(
                            value: b['id'] as int,
                            child: Text(b['name'] as String),
                          );
                        }).toList(),
                        onChanged: (v) => setState(() => _selectedBeltId = v),
                      ),
                      CustomInput(
                        width: 110,
                        label: 'Peso (Kg)',
                        type: InputType.number,
                        controller: _weightController,
                        placeholder: '00.0',
                      ),
                      CustomInput(
                        width: 110,
                        label: 'Talla (Cm)',
                        type: InputType.number,
                        controller: _heightController,
                        placeholder: '000',
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // Botón de acción principal
                  Align(
                    alignment: Alignment.centerRight,
                    child: FilledButton(
                      style: ButtonStyle(
                      ),
                      onPressed: _saveStudent,
                      child: const Text(
                        'Guardar Alumno',
                        style: TextStyle(fontWeight: AppTypography.regular),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 45,
          height: 4,
          decoration: BoxDecoration(
            color: FluentTheme.of(context).accentColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  void _saveStudent() {
    if (_formKey.currentState!.validate()) {
      if (_selectedHqId == null || _selectedBeltId == null) {
        showDialog(
          context: context,
          builder: (context) => ContentDialog(
            title: const Text('Campos incompletos'),
            content: const Text('Por favor, seleccione una Sede y un Cinturón.'),
            actions: [
              Button(
                child: const Text('Aceptar'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
        return;
      }

      final student = StudentsEntity(
        id: null,
        names: _namesController.text,
        surnames: _surnamesController.text,
        typeIdentify: _typeIdentify,
        numberIdentify: _idNumberController.text,
        birthDate: _birthDate,
        gender: _gender,
        weightKg: double.tryParse(_weightController.text) ?? 0.0,
        heightCm: double.tryParse(_heightController.text) ?? 0.0,
        headquarterId: _selectedHqId!,
        beltId: _selectedBeltId!,
        tournamentWins: 0,
        participations: 0,
      );

      context.read<StudentsController>().addStudent(student);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _namesController.dispose();
    _surnamesController.dispose();
    _idNumberController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }
}