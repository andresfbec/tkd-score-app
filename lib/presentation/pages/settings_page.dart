import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.isDarkMode;

    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          'Ajustes', 
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
        child: Text("Page Settings", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
