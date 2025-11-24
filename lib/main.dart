import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(const MyApp()); //punto de entrada a la aplicación Flutter
}

//esta es una pantalla y aca definimos las cosas globales de la aplicacion como titulo y esas cosas
class MyApp extends StatelessWidget {
  const MyApp({super.key}); //constructor con super.key

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Mi primera app',
      home: const HomePage(), //pantalla principal de la aplicación
      debugShowCheckedModeBanner: false,
    );
  }
}

//vista pantalla principal del aplicativo (lo primero q ve el usuario)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      //esto de scaffolpage es el 'andamio' o estructura de la pantalla
      header: const PageHeader(title: Text('🥋 TKD Nexus')),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hola, bienvenido esta es primera pagina web construida en flutter',
          ),
          const Text('Este es un segundo texto por practicar'),
          const SizedBox(height: 20, width: 10,),
          TextBox(
            placeholder: 'Tu nombre aqui',
            onChanged: (valor) =>  print('el valor fue $valor')
          ),
          SizedBox(height: 20, width: 1,),
          Button(
            child: const Text('Imprime lo que escribiste'),
            onPressed: () => print('hola mundo')
          ),
        ],
      ),
    );
  }
}
