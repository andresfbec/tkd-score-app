import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'core/theme/theme_provider.dart';

void main() {
  runApp( // start app
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const App(),
    ),
  );
}