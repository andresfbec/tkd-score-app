// lib/app/providers.dart
import 'package:provider/provider.dart';

import '../../presentation/controllers/headquarters_controller.dart';
import '../../presentation/controllers/user_controller.dart';
import '../../presentation/controllers/login_controller.dart';
import '../../core/theme/theme_provider.dart';
import '../core/config/containers/dependencia_headquarts.dart';
import '../core/config/containers/dependencia_user.dart';
import '../presentation/controllers/session_controller.dart';

class AppProviders {
  static Future<List<ChangeNotifierProvider>> init() async {
    // Inicializaciones necesarias
    await InjectionUser.init();
    await InjectionHeadquart.init();

    final containerUser = InjectionUser();
    final containerHeadquarts = InjectionHeadquart();

    return [
      // ThemeProvider
      ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),

      // LoginController
      ChangeNotifierProvider<LoginController>(
        create: (_) => LoginController(
          containerUser.loginUser,
          containerUser.sessionController,
        ),
      ),

      ChangeNotifierProvider<HeadquartersController>(
        create: (_) => HeadquartersController(
          containerHeadquarts.createHeadquart, // 1. CreateHeadquart
          containerHeadquarts.updateHeadquart, // 2. UpdateHeadquart
          containerHeadquarts.deleteHeadquart, // 3. DeleteHeadquart
          containerHeadquarts
              .headquartersRepository, // 4. HeadquartersRepository
          containerHeadquarts.getHeadquart, // 5. GetHeadquart
        )..loadHeadquarters(),
      ),
      ChangeNotifierProvider<UserController>(
        create: (_) => UserController(
          containerUser.createUser,
          containerUser.userRepository,
        )..loadUsers(),
      ),
      ChangeNotifierProvider<SessionController>(
        create: (_) => containerUser.sessionController,
      ),
    ];
  }
}
