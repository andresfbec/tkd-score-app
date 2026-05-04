import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../../controllers/students_controller.dart';
import '../../../controllers/headquarters_controller.dart';
import '../../../controllers/belts_controller.dart';
import '../../../../app/ui_state_provider.dart';
import '../../../../core/constants/app.dart';

class StudentsFilterPanel extends StatefulWidget {
  const StudentsFilterPanel({super.key});

  @override
  State<StudentsFilterPanel> createState() => _StudentsFilterPanelState();
}

class _StudentsFilterPanelState extends State<StudentsFilterPanel> {
  late List<int> _selectedHqIds;
  late List<int> _selectedBeltIds;
  String? _gender;
  late TextEditingController _minAgeController;
  late TextEditingController _maxAgeController;
  late TextEditingController _minWeightController;
  late TextEditingController _maxWeightController;

  @override
  void initState() {
    super.initState();
    final controller = context.read<StudentsController>();
    _selectedHqIds = List<int>.from(controller.currentHqIds ?? []);
    _selectedBeltIds = List<int>.from(controller.currentBeltIds ?? []);
    _gender = controller.currentGender;
    _minAgeController = TextEditingController(
      text: controller.currentMinAge?.toString() ?? '',
    );
    _maxAgeController = TextEditingController(
      text: controller.currentMaxAge?.toString() ?? '',
    );
    _minWeightController = TextEditingController(
      text: controller.currentMinWeight?.toString() ?? '',
    );
    _maxWeightController = TextEditingController(
      text: controller.currentMaxWeight?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _minAgeController.dispose();
    _maxAgeController.dispose();
    _minWeightController.dispose();
    _maxWeightController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    final minAge = int.tryParse(_minAgeController.text);
    final maxAge = int.tryParse(_maxAgeController.text);
    final minWeight = double.tryParse(_minWeightController.text);
    final maxWeight = double.tryParse(_maxWeightController.text);

    context.read<StudentsController>().startListening(
      hqIds: _selectedHqIds.isEmpty ? null : _selectedHqIds,
      beltIds: _selectedBeltIds.isEmpty ? null : _selectedBeltIds,
      gender: _gender,
      minAge: minAge,
      maxAge: maxAge,
      minWeight: minWeight,
      maxWeight: maxWeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ui = context.watch<UIStateProvider>();
    final hqController = context.watch<HeadquartersController>();
    final beltsController = context.watch<BeltsController>();
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness.isDark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 300,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF202020) : Colors.white,
        border: Border(
          left: BorderSide(
            color: isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(-2, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filtros',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.getTextPrimary(isDark),
                  ),
                ),
                IconButton(
                  icon: const Icon(FluentIcons.chrome_close),
                  onPressed: () => context.read<UIStateProvider>().toggleStudentsFilter(),
                ),
              ],
            ),
          ),
          const Divider(),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // Headquarters
                _buildSectionTitle('Sedes', isDark),
                ...hqController.headquarters.map((hq) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Checkbox(
                    content: Text(hq.name),
                    checked: _selectedHqIds.contains(hq.id),
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _selectedHqIds.add(hq.id!);
                        } else {
                          _selectedHqIds.remove(hq.id);
                        }
                      });
                      _applyFilters();
                    },
                  ),
                )),
                const SizedBox(height: 16),

                // Belts
                _buildSectionTitle('Cinturones', isDark),
                ...beltsController.belts.map((belt) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Checkbox(
                    content: Text(belt.name),
                    checked: _selectedBeltIds.contains(belt.id),
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _selectedBeltIds.add(belt.id!);
                        } else {
                          _selectedBeltIds.remove(belt.id);
                        }
                      });
                      _applyFilters();
                    },
                  ),
                )),
                const SizedBox(height: 16),

                // Gender
                _buildSectionTitle('Género', isDark),
                Row(
                  children: [
                    RadioButton(
                      content: const Text('Masculino'),
                      checked: _gender == 'Masculino',
                      onChanged: (val) {
                        setState(() => _gender = val ? 'Masculino' : null);
                        _applyFilters();
                      },
                    ),
                    const SizedBox(width: 16),
                    RadioButton(
                      content: const Text('Femenino'),
                      checked: _gender == 'Femenino',
                      onChanged: (val) {
                        setState(() => _gender = val ? 'Femenino' : null);
                        _applyFilters();
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(FluentIcons.clear),
                      onPressed: () {
                        setState(() => _gender = null);
                        _applyFilters();
                      },
                    )
                  ],
                ),
                const SizedBox(height: 16),

                // Age
                _buildSectionTitle('Edad', isDark),
                Row(
                  children: [
                    Expanded(
                      child: TextBox(
                        controller: _minAgeController,
                        placeholder: 'Min',
                        keyboardType: TextInputType.number,
                        onChanged: (_) => _applyFilters(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextBox(
                        controller: _maxAgeController,
                        placeholder: 'Max',
                        keyboardType: TextInputType.number,
                        onChanged: (_) => _applyFilters(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Weight
                _buildSectionTitle('Peso (kg)', isDark),
                Row(
                  children: [
                    Expanded(
                      child: TextBox(
                        controller: _minWeightController,
                        placeholder: 'Min',
                        keyboardType: TextInputType.number,
                        onChanged: (_) => _applyFilters(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextBox(
                        controller: _maxWeightController,
                        placeholder: 'Max',
                        keyboardType: TextInputType.number,
                        onChanged: (_) => _applyFilters(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                Button(
                  child: const Text('Limpiar filtros'),
                  onPressed: () {
                    setState(() {
                      _selectedHqIds.clear();
                      _selectedBeltIds.clear();
                      _gender = null;
                      _minAgeController.clear();
                      _maxAgeController.clear();
                      _minWeightController.clear();
                      _maxWeightController.clear();
                    });
                    _applyFilters();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}
