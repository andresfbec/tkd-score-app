import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false; //global state to theme : dark/light

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}