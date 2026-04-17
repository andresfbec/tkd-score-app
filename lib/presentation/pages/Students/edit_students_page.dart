import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../widgets/inputs/custom_input.dart';
import '../../widgets/inputs/custom_dropdown.dart';
import '../../widgets/inputs/custom_date_picker.dart';

import '../../../domain/entities/students_entity.dart';
import '../../controllers/students_controller.dart';
import '../../controllers/headquarters_controller.dart';
import '../../forms/validators.dart';
import '../../../core/enums/input_type.dart';
import '../../../core/constants/app.dart';
import '../../../core/constants/student_form_options.dart';

class StudentEditPage extends StatefulWidget {
  final StudentsEntity student;

  const StudentEditPage({super.key, required this.student});

  @override
  State<StudentEditPage> createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _namesController;
  late TextEditingController _surnamesController;
  late TextEditingController _idNumberController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;

  late DateTime _birthDate;
  late String _gender;
  late String _typeIdentify;
  int? _selectedHqId;
  int? _selectedBeltId;

  @override
  void initState() {
    super.initState();
    _namesController = TextEditingController(text: widget.student.names);
    _surnamesController = TextEditingController(text: widget.student.surnames);
    _idNumberController = TextEditingController(text: widget.student.numberIdentify);
    _weightController = TextEditingController(text: widget.student.weightKg.toString());
    _heightController = TextEditingController(text: widget.student.heightCm.toString());

    _birthDate = widget.student.birthDate;
    _gender = widget.student.gender;
    _typeIdentify = widget.student.typeIdentify;
    _selectedHqId = widget.student.headquarterId;
    _selectedBeltId = widget.student.beltId;
  }

  @override
  Widget build(BuildContext context) {
    final hqController = context.watch<HeadquartersController>();
    final bool isDark = FluentTheme.of(context).brightness == Brightness.dark;

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
                    child: Text('Alumnos', 
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: AppTypography.titleView,
                        fontFamily: AppTypography.fontFamily,
                      )
                    ),
                  ),
                ),
              ),
              const TextSpan(text: '  >  '),
              TextSpan(
                text: 'Editar Alumno: ${widget.student.names}',
                style: const TextStyle(fontWeight: FontWeight.w600),
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
                        controller: _namesController,
                        type: InputType.name,
                        validator: FormValidations.validateName,
                      ),
                      CustomInput(
                        width: 360,
                        label: 'Apellidos Completos',
                        controller: _surnamesController,
                        type: InputType.name,
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
                        width: 250,
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
                        width: 216,
                        label: 'Número de Documento',
                        type: InputType.number,
                        controller: _idNumberController,
                        validator: (v) => FormValidations.required(v, field: 'Documento'),
                      ),
                      CustomDropdown<int>(
                        width: 230,
                        label: 'Sede de Entrenamiento',
                        value: _selectedHqId,
                        items: hqController.headquarters.map((h) {
                          return ComboBoxItem<int>(value: h.id, child: Text(h.name));
                        }).toList(),
                        onChanged: (v) => setState(() => _selectedHqId = v),
                      ),
                      CustomDropdown<int>(
                        width: 230,
                        label: 'Cinturón Actual',
                        value: _selectedBeltId,
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
                      ),
                      CustomInput(
                        width: 110,
                        label: 'Talla (Cm)',
                        type: InputType.number,
                        controller: _heightController,
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FilledButton(
                      onPressed: _updateStudent,
                      // style: ButtonStyle(
                      //   padding: ButtonState.all(const EdgeInsets.symmetric(horizontal: 40, vertical: 12)),
                      // ),
                      child: const Text('Actualizar Alumno'),
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
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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

  void _updateStudent() {
    if (_formKey.currentState!.validate()) {
      if (_selectedHqId == null || _selectedBeltId == null) return;

      final updatedStudent = widget.student.copyWith(
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
      );

      context.read<StudentsController>().editStudent(updatedStudent);
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