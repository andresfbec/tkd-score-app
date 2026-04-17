import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app.dart';
import '../../../core/constants/tournament_form_options.dart';
import '../../../core/enums/input_type.dart';
import '../../../core/enums/status.dart';
import '../../../core/utils/status_handler.dart';
import '../../../domain/entities/tournament_entity.dart';

import '../../controllers/tournaments_controller.dart';
import '../../forms/validators.dart';
import '../../widgets/inputs/custom_date_picker.dart';
import '../../widgets/inputs/custom_dropdown.dart';
import '../../widgets/inputs/custom_input.dart';

/// Formulario de torneo. [existing] distinto de null implica modo edición
/// (también puedes usar [EditTournamentPage]).
class CreateTournamentPage extends StatefulWidget {
  final TournamentEntity? existing;

  const CreateTournamentPage({super.key, this.existing});

  bool get isEditMode => existing != null;

  @override
  State<CreateTournamentPage> createState() => _CreateTournamentPageState();
}

class _CreateTournamentPageState extends State<CreateTournamentPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _hostController = TextEditingController();
  final _locationController = TextEditingController();

  late DateTime _dateStart;
  late DateTime _dateEnd;
  late String _tournamentStatus;
  late String _discipline;
  late String _setupPhase;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _nameController.text = e.name;
      _hostController.text = e.host;
      _locationController.text = e.location;
      _dateStart = e.dateStart;
      _dateEnd = e.dateEnd;
      _tournamentStatus = e.status;
      _discipline = e.discipline;
      _setupPhase = e.setupPhase;
    } else {
      final now = DateTime.now();
      _dateStart = DateTime(now.year, now.month, now.day);
      _dateEnd = _dateStart.add(const Duration(days: 1));
      _tournamentStatus = 'draft';
      _discipline = 'combat';
      _setupPhase = 'draft';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final tournamentsController = context.watch<TournamentsController>();
    handleStatus(context, tournamentsController);

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
                      'Torneos',
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
                text: widget.isEditMode
                    ? 'Editar: ${widget.existing!.name}'
                    : 'Crear torneo',
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
            constraints: const BoxConstraints(maxWidth: 880),
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 48),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  _buildSectionTitle(context, 'Datos generales'),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      CustomInput(
                        width: 400,
                        label: 'Nombre del torneo',
                        type: InputType.name,
                        controller: _nameController,
                        placeholder: 'Ej. Copa regional 2026',
                        validator: FormValidations.validateName,
                      ),
                      CustomInput(
                        width: 400,
                        label: 'Organizador / anfitrión',
                        type: InputType.text,
                        controller: _hostController,
                        placeholder: 'Opcional',
                      ),
                      CustomInput(
                        width: 400,
                        label: 'Lugar',
                        type: InputType.text,
                        controller: _locationController,
                        placeholder: 'Ciudad, recinto o dirección',
                        validator: (v) =>
                            FormValidations.required(v, field: 'Lugar'),
                      ),
                      CustomDatePicker(
                        width: 400,
                        label: 'Fecha de inicio',
                        selected: _dateStart,
                        onChanged: (v) => setState(() => _dateStart = v),
                      ),
                      CustomDatePicker(
                        width: 400,
                        label: 'Fecha de fin',
                        selected: _dateEnd,
                        onChanged: (v) => setState(() => _dateEnd = v),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _buildSectionTitle(context, 'Estado y modalidad'),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      CustomDropdown<String>(
                        width: 260,
                        label: 'Estado del torneo',
                        value: _tournamentStatus,
                        items: TournamentFormOptions.tournamentStatuses
                            .map(
                              (item) => ComboBoxItem<String>(
                                value: item['value']!,
                                child: Text(item['label']!),
                              ),
                            )
                            .toList(),
                        onChanged: (v) =>
                            setState(() => _tournamentStatus = v!),
                      ),
                      CustomDropdown<String>(
                        width: 260,
                        label: 'Modalidad',
                        value: _discipline,
                        items: TournamentFormOptions.disciplines
                            .map(
                              (item) => ComboBoxItem<String>(
                                value: item['value']!,
                                child: Text(item['label']!),
                              ),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => _discipline = v!),
                      ),
                      if (widget.isEditMode)
                        CustomDropdown<String>(
                          width: 320,
                          label: 'Fase de montaje',
                          value: _setupPhase,
                          items: TournamentFormOptions.setupPhases
                              .map(
                                (item) => ComboBoxItem<String>(
                                  value: item['value']!,
                                  child: Text(item['label']!),
                                ),
                              )
                              .toList(),
                          onChanged: (v) =>
                              setState(() => _setupPhase = v!),
                        ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      Button(
                        child: const Text('Cancelar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Spacer(),
                      FilledButton(
                        onPressed: _onSave,
                        child: Text(
                          widget.isEditMode
                              ? 'Actualizar torneo'
                              : 'Guardar torneo',
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
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
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

  Future<void> _onSave() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    if (_dateEnd.isBefore(_dateStart)) {
      await showDialog(
        context: context,
        builder: (ctx) => ContentDialog(
          title: const Text('Fechas inválidas'),
          content: const Text(
            'La fecha de fin debe ser la misma o posterior a la de inicio.',
          ),
          actions: [
            FilledButton(
              child: const Text('Aceptar'),
              onPressed: () => Navigator.pop(ctx),
            ),
          ],
        ),
      );
      return;
    }

    final controller = context.read<TournamentsController>();
    final startStr = _formatDate(_dateStart);
    final endStr = _formatDate(_dateEnd);

    if (widget.isEditMode && widget.existing?.id != null) {
      await controller.updateTournament(
        id: widget.existing!.id!,
        name: _nameController.text,
        host: _hostController.text,
        location: _locationController.text,
        dateStart: startStr,
        dateEnd: endStr,
        tournamentStatus: _tournamentStatus,
        discipline: _discipline,
        setupPhase: _setupPhase,
      );
    } else {
      await controller.createTournament(
        name: _nameController.text,
        host: _hostController.text,
        location: _locationController.text,
        dateStart: startStr,
        dateEnd: endStr,
        tournamentStatus: _tournamentStatus,
        discipline: _discipline,
      );
    }

    if (!mounted) return;
    if (controller.status == Status.success) {
      Navigator.pop(context);
    }
  }

  String _formatDate(DateTime d) {
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _hostController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}
