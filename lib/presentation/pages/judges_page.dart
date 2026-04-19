import 'package:fluent_ui/fluent_ui.dart';
import '../../core/constants/app.dart';

// mocker
import '../mockers/judges_mock.dart';

// Widgets
import '../widgets/custom_button.dart';
import '../widgets/input_search.dart';
import '../widgets/cards/judge_card.dart';

class JudgesPage extends StatelessWidget {
  const JudgesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = FluentTheme.of(context).brightness == Brightness.dark;
    final List<Referee> judges = JudgesMock.getMockReferees();

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
            /// 🔹 TOP BAR (igual a tu estilo)
            Row(
              children: [
                const SizedBox(width: 8),

                /// Crear
                FluentActionButton(
                  icon: FluentIcons.add,
                  label: 'Crear juez',
                  onPressed: () {},
                  filled: true,
                ),

                const SizedBox(width: 16),

                /// Search (tu widget)
                SizedBox(
                  width: 250,
                  child: FluentSearchBox(
                    placeholder: 'Buscar juez...',
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.8,
                ),
                itemCount: judges.length, // mock
                itemBuilder: (context, index) {
                  final judge = judges[index];

                  return JudgeCard(
                    name: '${judge.firstName} ${judge.lastName}',
                    category: 'Clase ${index % 2 + 1}',
                    document: judge.nationalId,
                    phone: judge.phoneNumber,
                    rank: judge.rank,
                    tournaments: judge.participations,
                    club: judge.affiliatedClub,
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
