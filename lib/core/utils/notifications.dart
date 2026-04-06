import 'package:fluent_ui/fluent_ui.dart';

// Clase de utilidad para mostrar notificaciones en la aplicación succes, error, warning e info
class AppNotifications {
  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      title: "Éxito",
      message: message,
      severity: InfoBarSeverity.success,
    );
  }

  static void showError(BuildContext context, String message) {
    _show(
      context,
      title: "Error",
      message: message,
      severity: InfoBarSeverity.error,
    );
  }

  static void showWarning(BuildContext context, String message) {
    _show(
      context,
      title: "Advertencia",
      message: message,
      severity: InfoBarSeverity.warning,
    );
  }

  static void showInfo(BuildContext context, String message) {
    _show(
      context,
      title: "Información",
      message: message,
      severity: InfoBarSeverity.info,
    );
  }

  /// 🔹 MÉTODO BASE PRIVADO
  static void _show(
    BuildContext context, {
    required String title,
    required String message,
    required InfoBarSeverity severity,
  }) {
    displayInfoBar(
      context,
      alignment: Alignment.topCenter,
      builder: (context, close) {
        return InfoBar(
          title: Text(title),
          content: Text(message),
          severity: severity,
          onClose: close,
        );
      },
    );
  }
}