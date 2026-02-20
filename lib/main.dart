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

// inyeccion de providers
import 'app/providers.dart';

// Multiprovider
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  final providers = await AppProviders.init();

  runApp(
    MultiProvider(
      providers: providers, 
      child: const App(),
    ),
  );
}

