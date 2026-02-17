import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'presentation/controllers/headquarters_controller.dart';
import 'presentation/controllers/user_controller.dart';
import 'presentation/controllers/login_controller.dart';
import 'app/app.dart';
import 'core/theme/theme_provider.dart';

import 'core/config/dependencia_user.dart';
import 'core/config/dependencia_headquarts.dart';

// Multiprovider
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InjectionUser.init(); // 👈 ESTO ES CLAVE
  await InjectionHeadquart.init(); // 👈 ESTO ES CLAVE
  final containerUser = InjectionUser();
  final containerHeadquarts = InjectionHeadquart();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => HeadquartersController(
            containerHeadquarts.createHeadquart,
            containerHeadquarts.headquartersRepository,
            containerHeadquarts.getHeadquart,
          )..loadHeadquarters(), // Carga inicial de datos para Headquarters
        ),
        ChangeNotifierProvider(
          create: (_) => UserController(
            containerUser.createUser,
            containerUser.userRepository,
          )..loadUsers(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginController(containerUser.loginUser),
        ),
      ],
      child: const App(),
    ),
  );
}
