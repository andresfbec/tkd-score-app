import 'package:fluent_ui/fluent_ui.dart';
import '../presentation/pages/login_page.dart'; //page login

class Routes {
  static const String login = '/login';

  static Map<String, WidgetBuilder> getRoutes() {
    return {login: (context) => const LoginPage()};
  }
}
