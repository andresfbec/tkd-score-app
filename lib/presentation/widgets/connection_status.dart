import 'package:fluent_ui/fluent_ui.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';
import '../../core/constants/app.dart';

class ConnectionStatus extends StatefulWidget {
  const ConnectionStatus({super.key});

  @override
  State<ConnectionStatus> createState() => _ConnectionStatusState();
}

class _ConnectionStatusState extends State<ConnectionStatus> {
  bool isOnline = false;

  @override
  void initState() {
    super.initState();
    _checkConnection();

    // escuchar cambios en tiempo real
    Connectivity().onConnectivityChanged.listen((result) async {
      bool hasInternet = await _hasInternet();
      setState(() {
        isOnline = result != ConnectivityResult.none && hasInternet;
      });
    });
  }

  Future<void> _checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool hasInternet = await _hasInternet();
    setState(() {
      isOnline = connectivityResult != ConnectivityResult.none && hasInternet;
    });
  }

  // Verifica acceso real a Internet
  Future<bool> _hasInternet() async {
    try {
      final result = await InternetAddress.lookup(
        'google.com',
      ); // ping a Google DNS comprobación
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Definimos el texto del estado de conexión para reusarlo
    final statusMessage = isOnline ? 'Conectado' : 'Sin conexión';

    return Tooltip(
      message: statusMessage,
      // Fluent UI maneja una propiedad llamada 'displayHorizon' o 'style' 
      // si quisieras tunearlo, pero por defecto funciona al hacer hover.
      child: Icon(
        isOnline ? FluentIcons.wifi : FluentIcons.warning,
        size: AppTypography.iconMedium, // 16.0
        color: isOnline ? AppColors.wifiIcon : AppColors.error,
      ),
    );
  }
}