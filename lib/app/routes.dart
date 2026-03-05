import 'package:fluent_ui/fluent_ui.dart';
import '../presentation/pages/login_page.dart'; // page login
import '../presentation/layout/app_shell.dart'; // main app shell (skeleton with pages)

class Routes {
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginPage(),
      home: (context) => const AppShell(), // aca dentro estan las demas rutas como tournaments, settings...
    };
  }
}
