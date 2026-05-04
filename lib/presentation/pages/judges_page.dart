import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app.dart';
import '../../core/enums/status.dart';
import '../controllers/judges_controller.dart';
import '../widgets/cards/judge_card.dart';
import '../widgets/input_search.dart';

// Modals & Forms
import '../widgets/modals/custom_form_modal.dart';
import '../forms/validators.dart';
import '../../core/enums/input_type.dart';
import '../../core/utils/status_handler.dart';

// Entities
import '../../domain/entities/judge_entity.dart';

class JudgesPage extends StatefulWidget {
  const JudgesPage({super.key});

  @override
  State<JudgesPage> createState() => _JudgesPageState();
}

class _JudgesPageState extends State<JudgesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JudgesController>().startListening();
    });
  }

  // ===============================
  // MODALES (CREATE / EDIT)
  // ===============================

  void _showCreateJudgeModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => CustomFormModal(
        title: "Crear nuevo juez",
        fields: [
          FormFieldConfig(
            name: "names",
            label: "Nombres",
            type: InputType.name,
            validator: (v) => FormValidations.required(v, field: "Nombres"),
          ),
          FormFieldConfig(
            name: "document",
            label: "Documento",
            type: InputType.number,
            validator: (v) => FormValidations.required(v, field: "Documento"),
          ),
          FormFieldConfig(
            name: "club",
            label: "Club",
            type: InputType.name,
          ),
          FormFieldConfig(
            name: "phone",
            label: "Teléfono",
            type: InputType.phone,
            validator: FormValidations.validatePhone,
          ),
          FormFieldConfig(
            name: "rank",
            label: "Rango / Categoría",
            type: InputType.text,
          ),
        ],
        onSubmit: (data) async {
          final judge = JudgeEntity(
            names: data["names"] ?? '',
            document: data["document"] ?? '',
            club: data["club"] ?? '',
            phone: data["phone"] ?? '',
            rank: data["rank"] ?? '',
          );
          await context.read<JudgesController>().addJudge(judge);
        },
      ),
    );
  }

  void _showEditJudgeModal(BuildContext context, JudgeEntity judge) {
    showDialog(
      context: context,
      builder: (dialogContext) => CustomFormModal(
        title: "Editar juez: ${judge.names}",
        initialValues: {
          "names": judge.names,
          "document": judge.document,
          "club": judge.club,
          "phone": judge.phone,
          "rank": judge.rank,
        },
        fields: [
          FormFieldConfig(
            name: "names",
            label: "Nombres",
            type: InputType.name,
            validator: (v) => FormValidations.required(v, field: "Nombres"),
          ),
          FormFieldConfig(
            name: "document",
            label: "Documento",
            type: InputType.number,
            validator: (v) => FormValidations.required(v, field: "Documento"),
          ),
          FormFieldConfig(
            name: "club",
            label: "Club",
            type: InputType.name,
          ),
          FormFieldConfig(
            name: "phone",
            label: "Teléfono",
            type: InputType.phone,
            validator: FormValidations.validatePhone,
          ),
          FormFieldConfig(
            name: "rank",
            label: "Rango / Categoría",
            type: InputType.text,
          ),
        ],
        onSubmit: (data) async {
          final updatedJudge = judge.copyWith(
            names: data["names"] ?? '',
            document: data["document"] ?? '',
            club: data["club"] ?? '',
            phone: data["phone"] ?? '',
            rank: data["rank"] ?? '',
          );
          await context.read<JudgesController>().editJudge(updatedJudge);
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int id, String name) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('¿Eliminar juez?'),
        content: Text(
          '¿Estás seguro de que deseas eliminar a $name? Esta acción realizará un borrado lógico del registro.',
        ),
        actions: [
          Button(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
          FilledButton(
            style: ButtonStyle(
              backgroundColor: ButtonState.all(Colors.red),
            ),
            child: const Text('Eliminar'),
            onPressed: () {
              context.read<JudgesController>().removeJudge(id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = FluentTheme.of(context).brightness == Brightness.dark;
    final judgesController = context.watch<JudgesController>();
    final judges = judgesController.filteredJudges;

    // Manejo de estados y notificaciones
    handleStatus(context, judgesController);

    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          'Jueces',
          style: TextStyle(
            fontSize: AppTypography.titleView,
            fontWeight: AppTypography.semiBold,
            fontFamily: AppTypography.fontFamily,
            color: AppColors.getTextPrimary(isDark),
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔹 TOP BAR
            Row(
              children: [
                const SizedBox(width: 8),

                /// Crear
                FluentActionButton(
                  icon: FluentIcons.add,
                  label: 'Crear juez',
                  onPressed: () => _showCreateJudgeModal(context),
                  filled: true,
                ),

                const SizedBox(width: 16),

                /// Search
                SizedBox(
                  width: 250,
                  child: FluentSearchBox(
                    placeholder: 'Buscar juez...',
                    onChanged: (value) {
                      judgesController.updateSearch(value);
                    },
                  ),
                ),

                const Spacer(),
              ],
            ),

            const SizedBox(height: 16),

            /// 🔹 GRID DE CARDS
            Expanded(
              child: judges.isEmpty
                  ? Center(
                      child: Text(
                        judgesController.status == Status.loading
                            ? 'Cargando jueces...'
                            : 'No se encontraron jueces.',
                        style: TextStyle(color: isDark ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5)),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.8,
                      ),
                      itemCount: judges.length,
                      itemBuilder: (context, index) {
                        final judge = judges[index];

                        return JudgeCard(
                          name: judge.names,
                          category: judge.rank.isNotEmpty ? judge.rank : 'Sin rango',
                          document: judge.document,
                          phone: judge.phone,
                          rank: judge.rank,
                          tournaments: judge.participations,
                          club: judge.club,
                          onEdit: () => _showEditJudgeModal(context, judge),
                          onDelete: () => _showDeleteDialog(context, judge.id!, judge.names),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget auxiliar para botones de acción (siguiendo tu estilo)
class FluentActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool filled;

  const FluentActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    if (filled) {
      return FilledButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      );
    }
    return Button(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
