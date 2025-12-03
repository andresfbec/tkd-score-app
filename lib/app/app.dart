import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../core/theme/theme_provider.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return FluentApp(
      title: 'TKD App',
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
        accentColor: Colors.blue,
        brightness: themeProvider.isDarkMode
            ? Brightness.dark
            : Brightness.light,
        typography: Typography.raw(
          display: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          body: const TextStyle(fontSize: 14, fontFamily: 'Segoe UI'),
        ),
      ),
      initialRoute: Routes.login,
      routes: Routes.getRoutes(),
    );
  }
}