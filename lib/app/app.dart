import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../core/theme/theme_provider.dart';
import 'routes.dart';
import '../core/constants/app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return FluentApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: AppConstants.debugBanner,
      theme: themeProvider.currentTheme,
      initialRoute: Routes.login,
      routes: Routes.getRoutes(),
    );
  }
}