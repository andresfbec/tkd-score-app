import 'package:fluent_ui/fluent_ui.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.isDarkMode;

    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          'Usuarios', 
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
          "Comming soon...",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}