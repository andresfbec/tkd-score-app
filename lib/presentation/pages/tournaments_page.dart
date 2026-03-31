import 'package:fluent_ui/fluent_ui.dart';
import '../../core/constants/app.dart';

// Widgets tuyos
import '../widgets/custom_button.dart';
import '../widgets/input_search.dart';

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        FluentTheme.of(context).brightness == Brightness.dark;

    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          'Torneos',
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

            /// 🔹 TOP BAR (igual a tu estilo)
            Row(
              children: [
                const SizedBox(width: 8),
                /// Crear
                FluentActionButton(
                  icon: FluentIcons.add,
                  label: 'Crear torneo',
                  onPressed: () {},
                  filled: true,
                ),

                const SizedBox(width: 16),

                /// Search (tu widget)
                SizedBox(
                  width: 250,
                  child: FluentSearchBox(
                    placeholder: 'Buscar torneo...',
                    onChanged: (value) {},
                  ),
                ),

                const Spacer(),
              ],
            ),

            const SizedBox(height: 16),

            /// 🔹 GRID DE CARDS
            Expanded(
              child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: 12, // mock
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isDark
                          ? const Color(0xFF1E1E1E)
                          : const Color(0xFFF9F9F9),
                    ),
                    padding: const EdgeInsets.all(12),

                    /// 👇 CARD (solo placeholder)
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Torneo $index'),

                        const SizedBox(height: 8),

                        const Text('Categoría'),

                        const Spacer(),

                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(FluentIcons.contact),
                        ),
                      ],
                    ),
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