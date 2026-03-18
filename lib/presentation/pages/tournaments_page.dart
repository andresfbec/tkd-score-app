import 'package:fluent_ui/fluent_ui.dart';
import '../../core/constants/app.dart';
import 'package:provider/provider.dart';
import '../../core/theme/theme_provider.dart';

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.isDarkMode;

    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          'Torneos', 
          style: TextStyle(
            fontSize: AppTypography
                .titleView, 
            fontWeight:
                AppTypography.semiBold, 
            fontFamily: AppTypography.fontFamily, 
            color: AppColors.getTextPrimary(
              isDark,
            ), 
          ),
        ),
      ),
      content: const Center(
        child: Text(
          "Page Home Tournaments Dashboard",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}