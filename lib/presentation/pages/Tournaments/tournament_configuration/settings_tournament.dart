import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app.dart';
import '../../../../core/enums/input_type.dart';
import '../../../../core/enums/status.dart';
import '../../../../domain/entities/tournament_entity.dart';
import '../../../../domain/entities/combat_settings_entity.dart';
import '../../../controllers/combat_settings_controller.dart';
import '../../../forms/validators.dart';
import '../../../widgets/inputs/custom_dropdown.dart';
import '../../../widgets/inputs/custom_input.dart';

class SettingsTournament extends StatefulWidget {
  final TournamentEntity tournament;

  const SettingsTournament({super.key, required this.tournament});

  @override
  State<SettingsTournament> createState() => _SettingsTournamentState();
}

class _SettingsTournamentState extends State<SettingsTournament> {
  final _formKey = GlobalKey<FormState>();

  final _roundDurationController = TextEditingController();

  int _roundsMax = 3;
  String _formatType = 'points';
  final String _eliminationType = 'single'; // Forzado por defecto

  CombatSettingsEntity? _existingSettings;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExistingSettings();
  }

  Future<void> _loadExistingSettings() async {
    final controller = context.read<CombatSettingsController>();
    final existing = await controller.getByTournamentId(widget.tournament.id!);
    
    if (mounted) {
      setState(() {
        if (existing != null) {
          _existingSettings = existing;
          
          if ([1, 3, 5].contains(existing.roundsMax)) {
            _roundsMax = existing.roundsMax;
          } else {
            _roundsMax = 3;
          }

          _roundDurationController.text = existing.roundDurationSeconds.toString();
          
          if (['points', 'best_of_rounds'].contains(existing.formatType)) {
            _formatType = existing.formatType;
          } else {
            _formatType = 'points';
          }
        } else {
          // Valores por defecto
          _roundsMax = 3;
          _roundDurationController.text = '120'; 
          _formatType = 'points';
        }
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: Padding(padding: EdgeInsets.all(40.0), child: ProgressRing()));
    }

    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 880),
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 48, top: 40),
          child: Form(
            key: _formKey,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400), // Limita todo a 400px de ancho
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropdown<int>(
                      width: double.infinity,
                      label: 'Rondas Máximas',
                      value: _roundsMax,
                      items: const [
                        ComboBoxItem(value: 1, child: Text('1')),
                        ComboBoxItem(value: 3, child: Text('3')),
                        ComboBoxItem(value: 5, child: Text('5')),
                      ],
                      onChanged: (v) => setState(() => _roundsMax = v!),
                    ),
                    const SizedBox(height: 20),
                    CustomInput(
                      width: double.infinity,
                      label: 'Duración por Ronda (segundos)',
                      type: InputType.number,
                      controller: _roundDurationController,
                      placeholder: 'Ej. 120 para 2 minutos',
                      validator: (v) => FormValidations.required(v, field: 'Duración'),
                    ),
                    const SizedBox(height: 20),
                    CustomDropdown<String>(
                      width: double.infinity,
                      label: 'Tipo de Formato',
                      value: _formatType,
                      items: const [
                        ComboBoxItem(value: 'points', child: Text('Puntos')),
                        ComboBoxItem(value: 'best_of_rounds', child: Text('Mejor de rounds')),
                      ],
                      onChanged: (v) => setState(() => _formatType = v!),
                    ),
                    const SizedBox(height: 20),
                    CustomDropdown<String>(
                      width: double.infinity,
                      label: 'Tipo de Eliminación (No disponible)',
                      value: _eliminationType,
                      items: const [
                        ComboBoxItem(value: 'single', child: Text('Eliminación Sencilla')),
                        ComboBoxItem(value: 'double', child: Text('Doble Eliminación')),
                      ],
                      onChanged: null,
                    ),
                    const SizedBox(height: 36), // Espaciado controlado antes del botón
                    Row(
                      children: [
                        const Spacer(),
                        FilledButton(
                          onPressed: _onSave,
                          child: Text(
                            _existingSettings != null ? 'Actualizar' : 'Guardar Ajustes',
                            style: const TextStyle(
                              fontWeight: AppTypography.regular,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onSave() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final controller = context.read<CombatSettingsController>();
    
    final newSettings = CombatSettingsEntity(
      id: _existingSettings?.id,
      tournamentId: widget.tournament.id!,
      roundsMax: _roundsMax,
      formatType: _formatType,
      roundDurationSeconds: int.tryParse(_roundDurationController.text) ?? 120,
      pointsToWin: null,
      playAllRounds: 0,
      eliminationType: _eliminationType,
    );

    if (_existingSettings != null) {
      await controller.editSetting(newSettings);
    } else {
      await controller.addSetting(newSettings);
    }
  }

  @override
  void dispose() {
    _roundDurationController.dispose();
    super.dispose();
  }
}