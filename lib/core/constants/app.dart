// lib/core/constants/app_constants.dart
import 'package:fluent_ui/fluent_ui.dart';

class AppConstants {
  // Info app - Valores globales de la aplicación
  static const String appName =
      'TKD_App'; // Usar: En título de ventana, diálogos "Acerca de"
  static const bool debugBanner =
      false; // Usar: Solo en main.dart para FlutterApp

  // Default theme values - Configuración inicial del tema
  static const bool defaultDarkMode =
      false; // Usar: En ThemeProvider para valor inicial
  static const int defaultAccentColorIndex =
      5; // Usar: Índice inicial en Colors.accentColors
}

class AppTypography {
  // Valores de tipografía - Sistema de diseño tipográfico

  // === FAMILIA DE FUENTE ===
  static const String fontFamily =
      'Segoe UI'; // Usar: En todos los TextStyle de la app

  // === JERARQUÍA DE TAMAÑOS (Material Design System) ===

  // DISPLAY - Para pantallas de inicio, bienvenida, impacto visual alto
  static const double displayLarge =
      32.0; // Usar: Logotipo grande, mensajes hero
  static const double displayMedium =
      24.0; // Usar: Título principal de app, páginas de inicio
  static const double displaySmall =
      20.0; // Usar: Títulos secundarios importantes

  // TITLE - Para encabezados de sección y títulos de página
  static const double titleLarge = 18.0; // Usar: Título de páginas (PageHeader)
  static const double titleMedium =
      16.0; // Usar: Subtítulos, nombres de formularios
  static const double titleSmall =
      14.0; // Usar: Títulos de tarjetas, items de lista

  // Para titulos de las vistas
  static const double titleView = 24.0;

  // BODY - Para contenido principal y texto legible
  static const double bodyLarge =
      18.0; // Usar: Texto importante, párrafos destacados
  static const double bodyMedium =
      16.0; // Usar: Texto normal, contenido principal
  static const double bodySmall = 14.0; // Usar: Texto secundario, descripciones

  // LABEL - Para textos pequeños y etiquetas
  static const double caption =
      12.0; // Usar: Fechas, horas, estados, notificaciones
  static const double overline = 10.0; // Usar: Etiquetas, categorías, tags

  // ===== TAMAÑOS DE ICONOS =====
  static const double iconExtraSmall =
      12.0; // Para iconos muy pequeños (estados)
  static const double iconSmall =
      14.0; // Para iconos pequeños (sidebar podría usar este)
  static const double iconMedium =
      16.0; // Para iconos estándar (sidebar actual)
  static const double iconLarge =
      18.0; // Para iconos destacados (usuario en header)
  static const double iconExtraLarge = 20.0; // Para iconos muy importantes

  // === PESOS DE FUENTE ===
  // Usar según jerarquía: títulos más pesados, cuerpo normal
  static const FontWeight light =
      FontWeight.w300; // Usar: Texto sutil, no importante
  static const FontWeight regular =
      FontWeight.w400; // Usar: Texto normal (predeterminado)
  static const FontWeight medium =
      FontWeight.w500; // Usar: Texto que necesita énfasis
  static const FontWeight semiBold =
      FontWeight.w600; // Usar: Subtítulos, etiquetas importantes
  static const FontWeight bold = FontWeight.w700; // Usar: Títulos principales

  // === ALTURAS DE LÍNEA ===
  // Afectan el espacio vertical entre líneas de texto
  static const double tightLineHeight =
      1.0; // Usar: Títulos, textos cortos (compacto)
  static const double normalLineHeight = 1.2; // Usar: Texto normal (balanceado)
  static const double relaxedLineHeight =
      1.5; // Usar: Párrafos largos, mejor legibilidad
  static const double looseLineHeight =
      1.8; // Usar: Texto muy espaciado (accesibilidad)
}

class AppColors {
  // === PALETA PRIMARIA - Colores de marca de la app ===
  static const Color primary = Color(
    0xFFD32F2F,
  ); // Usar: Botones principales, acentos importantes
  static const Color secondary = Color(
    0xFF212121,
  ); // Usar: Fondos oscuros, texto en modo claro
  static const Color accent = Color(
    0xFFFFC107,
  ); // Usar: Destacar elementos, acciones secundarias
  static const Color wifiIcon = Color.fromARGB(255, 18, 190, 18);
  // === ESTADOS DEL SISTEMA - Feedback visual para el usuario ===
  static const Color success = Color(
    0xFF107C10,
  ); // Usar: Confirmaciones, completado, checkmarks ✓
  static const Color error = Color(
    0xFFD13438,
  ); // Usar: Errores, advertencias críticas, cancelado ✗
  static const Color warning = Color(
    0xFFF7630C,
  ); // Usar: Advertencias, pendiente, atención necesaria ⚠
  static const Color info = Color(
    0xFF0078D4,
  ); // Usar: Información, estados neutros, enlaces 🔗

  // === NEUTROS - Para fondos, superficies y contenedores ===
  static const Color backgroundLight = Color(
    0xFFFAFAFA,
  ); // Usar: Fondo principal en modo claro
  static const Color backgroundDark = Color(
    0xFF121212,
  ); // Usar: Fondo principal en modo oscuro
  static const Color surfaceLight = Color(
    0xFFFFFFFF,
  ); // Usar: Tarjetas, diálogos en modo claro
  static const Color surfaceDark = Color(
    0xFF1E1E1E,
  ); // Usar: Tarjetas, diálogos en modo oscuro

  // === COLORES DE TEXTO - Garantizan contraste y legibilidad ===
  static const Color textPrimaryLight = Color(
    0xFF000000,
  ); // Usar: Texto principal en modo claro
  static const Color textSecondaryLight = Color(
    0xFF666666,
  ); // Usar: Texto secundario en modo claro
  static const Color textPrimaryDark = Color(
    0xFFFFFFFF,
  ); // Usar: Texto principal en modo oscuro
  static const Color textSecondaryDark = Color(
    0xFFAAAAAA,
  ); // Usar: Texto secundario en modo oscuro

  // === BORDES Y SEPARADORES ===
  static const Color borderLight = Color(
    0xFFE0E0E0,
  ); // Usar: Bordes, divisores en modo claro
  static const Color borderDark = Color(
    0xFF333333,
  ); // Usar: Bordes, divisores en modo oscuro

  // === FUNCIONES ÚTILES - Para manejar tema claro/oscuro dinámicamente ===
  static Color getBackground(bool isDark) {
    return isDark ? backgroundDark : backgroundLight;
  }

  static Color getSurface(bool isDark) {
    return isDark ? surfaceDark : surfaceLight;
  }

  static Color getTextPrimary(bool isDark) {
    return isDark ? textPrimaryDark : textPrimaryLight;
  }

  static Color getTextSecondary(bool isDark) {
    return isDark ? textSecondaryDark : textSecondaryLight;
  }

  static Color getBorder(bool isDark) {
    return isDark ? borderDark : borderLight;
  } // Usar: Para texto principal según tema
}
