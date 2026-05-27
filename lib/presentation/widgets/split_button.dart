import 'package:fluent_ui/fluent_ui.dart';

class BotonIniciarWidget extends StatefulWidget {
  const BotonIniciarWidget({Key? key}) : super(key: key);

  @override
  State<BotonIniciarWidget> createState() => _BotonIniciarWidgetState();
}

class _BotonIniciarWidgetState extends State<BotonIniciarWidget> {
  // En la versión 4.9.0 el controlador se pasa directamente al Flyout
  final FlyoutController _flyoutController = FlyoutController();

  @override
  void dispose() {
    _flyoutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Usamos el constructor estándar de SplitButton para tu versión
    return SplitButton(
      // 1. El botón principal de la izquierda
      child: Button(
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Text(
            'Iniciar',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        onPressed: () {
          print('Acción principal: Iniciar ejecutado');
        },
      ),
      
      // 2. El menú que se abre al dar click en la flecha de la derecha
      // En tu versión, el parámetro 'flyout' es REQUERIDO obligatoriamente
      flyout: FlyoutContent(
        constraints: const BoxConstraints(maxWidth: 200),
        child: MenuFlyout(
          items: [
            MenuFlyoutItem(
              leading: const Icon(FluentIcons.settings),
              text: const Text('Configurar'),
              onPressed: () {
                // Cerramos el menú usando la navegación nativa del flyout en esta versión
                Navigator.of(context).pop(); 
                print('Acción secundaria: Configurar seleccionado');
              },
            ),
          ],
        ),
      ),
    );
  }
}