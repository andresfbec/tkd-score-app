import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = true; //global state to theme : dark/light

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}