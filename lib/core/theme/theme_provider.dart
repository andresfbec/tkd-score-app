// lib/core/theme/theme_provider.dart
import 'package:fluent_ui/fluent_ui.dart'; 
import '../constants/app.dart';

class ThemeProvider extends ChangeNotifier {
  // Estado actual (dinámico, cambia)
  bool _isDarkMode = AppConstants.defaultDarkMode;
  int _accentColorIndex = AppConstants.defaultAccentColorIndex;
  
  // Getters
  bool get isDarkMode => _isDarkMode;
  int get accentColorIndex => _accentColorIndex;
  // getter que convierte indice a color de fluent ui
  AccentColor get accentColor => Colors.accentColors[_accentColorIndex];
  
  // Setters/métodos

  // para actualizar estado 
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
  
  // metodo para establecer un tema específico
  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
  
  // Metodo para cambiar el color de acento 
  void setAccentColor(int index) {
    _accentColorIndex = index;
    notifyListeners();
  }
  
  // Método para obtener el theme completo
  FluentThemeData get currentTheme {
    return FluentThemeData(
      accentColor: accentColor,
      brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      typography: Typography.raw(
        display: TextStyle(
          fontSize: AppTypography.displayMedium,      // 24.0
          fontWeight: AppTypography.bold,             // FontWeight.bold
          fontFamily: AppTypography.fontFamily,       // 'Segoe UI'
          height: AppTypography.normalLineHeight,     // 1.2
        ),
        body: TextStyle(
          fontSize: AppTypography.bodyMedium,         // 14.0
          fontWeight: AppTypography.regular,          // FontWeight.w400
          fontFamily: AppTypography.fontFamily,
          height: AppTypography.relaxedLineHeight,    // 1.5
          color: _isDarkMode 
              ? AppColors.textPrimaryDark 
              : AppColors.textPrimaryLight,
        ),
        title: TextStyle(
          fontSize: AppTypography.titleLarge,         // 18.0
          fontWeight: AppTypography.semiBold,         // FontWeight.w600
          fontFamily: AppTypography.fontFamily,
          height: AppTypography.normalLineHeight,
        ),
        caption: TextStyle(
          fontSize: AppTypography.caption,            // 11.0
          fontWeight: AppTypography.regular,
          fontFamily: AppTypography.fontFamily,
          color: _isDarkMode 
              ? AppColors.textSecondaryDark 
              : AppColors.textSecondaryLight,
        ),
      ),
      scaffoldBackgroundColor: AppColors.getBackground(_isDarkMode),
    );
  }
}