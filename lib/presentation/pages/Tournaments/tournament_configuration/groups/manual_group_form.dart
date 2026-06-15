import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../../../domain/entities/groups_entity.dart';
import '../../../../controllers/groups_controller.dart';
import '../../../../controllers/belts_controller.dart';
import '../../../../widgets/inputs/custom_input.dart';
import '../../../../widgets/inputs/custom_dropdown.dart';
import '../../../../../core/enums/input_type.dart';

class ManualGroupForm extends StatefulWidget {
  final int tournamentId;
  const ManualGroupForm({super.key, required this.tournamentId});

  @override
  State<ManualGroupForm> createState() => _ManualGroupFormState();
}

class _ManualGroupFormState extends State<ManualGroupForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageMinController = TextEditingController();
  final _ageMaxController = TextEditingController();
  final _weightMinController = TextEditingController();
  final _weightMaxController = TextEditingController();
  
  String _gender = 'mixed';
  int? _beltFromId;
  int? _beltToId;

  @override
  void initState() {
    super.initState();
    _nameController.text = 'Nuevo Grupo';
  }

  @override
  Widget build(BuildContext context) {
    final beltsCtrl = context.watch<BeltsController>();
    
    return ContentDialog(
      title: const Text('Crear Nuevo Grupo'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomInput(
                label: 'Nombre del Grupo',
                controller: _nameController,
                placeholder: 'Ej. Senior Masc -80kg',
                type: InputType.text,
              ),
              const SizedBox(height: 16),
              CustomDropdown<String>(
                label: 'Género',
                value: _gender,
                items: const [
                  ComboBoxItem(value: 'male', child: Text('Masculino')),
                  ComboBoxItem(value: 'female', child: Text('Femenino')),
                  ComboBoxItem(value: 'mixed', child: Text('Mixto')),
                ],
                onChanged: (v) => setState(() => _gender = v!),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomInput(
                      label: 'Edad Mínima',
                      controller: _ageMinController,
                      placeholder: '0',
                      type: InputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomInput(
                      label: 'Edad Máxima',
                      controller: _ageMaxController,
                      placeholder: '99',
                      type: InputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomInput(
                      label: 'Peso Mínimo (kg)',
                      controller: _weightMinController,
                      placeholder: '0.0',
                      type: InputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomInput(
                      label: 'Peso Máximo (kg)',
                      controller: _weightMaxController,
                      placeholder: '999.0',
                      type: InputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomDropdown<int?>(
                      label: 'Cinturón Desde',
                      value: _beltFromId,
                      items: [
                        const ComboBoxItem(value: null, child: Text('Cualquiera')),
                        ...beltsCtrl.belts.map((b) => ComboBoxItem(
                          value: b.id,
                          child: Text(b.name),
                        )),
                      ],
                      onChanged: (v) => setState(() => _beltFromId = v),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomDropdown<int?>(
                      label: 'Cinturón Hasta',
                      value: _beltToId,
                      items: [
                        const ComboBoxItem(value: null, child: Text('Cualquiera')),
                        ...beltsCtrl.belts.map((b) => ComboBoxItem(
                          value: b.id,
                          child: Text(b.name),
                        )),
                      ],
                      onChanged: (v) => setState(() => _beltToId = v),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        Button(
          child: const Text('Cancelar'),
          onPressed: () => Navigator.pop(context),
        ),
        FilledButton(
          child: const Text('Crear Grupo'),
          onPressed: () {
            final group = GroupsEntity(
              tournamentId: widget.tournamentId,
              name: _nameController.text,
              gender: _gender,
              ageMin: int.tryParse(_ageMinController.text),
              ageMax: int.tryParse(_ageMaxController.text),
              weightMin: double.tryParse(_weightMinController.text),
              weightMax: double.tryParse(_weightMaxController.text),
              beltFromId: _beltFromId,
              beltToId: _beltToId,
              state: 'open',
            );
            context.read<GroupsController>().createGroup(group);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
