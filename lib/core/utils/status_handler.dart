import 'package:fluent_ui/fluent_ui.dart';
import '../../core/utils/notifications.dart';
import '../enums/status.dart';

// Función para manejar el estado y mostrar notificaciones según el status del controlador
// status + message 
// 1 solo handler 
// UI limpia 
void handleStatus(BuildContext context, dynamic controller) {
  final message = controller.message;
  final status = controller.status;

  if (message == null) return;

  WidgetsBinding.instance.addPostFrameCallback((_) {
    switch (status) {
      case Status.success:
        AppNotifications.showSuccess(context, message);
        break;
      case Status.error:
        AppNotifications.showError(context, message);
        break;
      case Status.warning:
        AppNotifications.showWarning(context, message);
        break;
      case Status.info:
        AppNotifications.showInfo(context, message);
        break;
      default:
        break;
    }
    controller.clearMessages();
  });
}