import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';

// inyeccion de providers
import 'app/providers.dart';

// Multiprovider
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providers = await AppProviders.init();

  runApp(MultiProvider(providers: providers, child: const App()));
}
