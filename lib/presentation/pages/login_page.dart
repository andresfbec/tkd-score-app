import 'package:fluent_ui/fluent_ui.dart';
import 'package:tkd_score/core/theme/theme_provider.dart';
import '../controllers/login_controller.dart';
import '../widgets/custom_input.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final passwordController = TextEditingController();
    final loginController = LoginController();

    final themeProvider = Provider.of<ThemeProvider>(context);


    final darkGradient = LinearGradient(
      colors: [Colors.black, const Color(0xFF212121)], // gris oscuro manual
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final lightGradient = LinearGradient(
      colors: [
        const Color(0xFFFFFFFF), // white
        const Color(0xFFE0E0E0), // gris claro
        const Color(0xFFBDBDBD), // gris medio
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );


    return NavigationView(
      content: ScaffoldPage(
        content: Container(
          decoration: BoxDecoration(
            gradient: themeProvider.isDarkMode ? darkGradient : lightGradient,
          ),
          child: Stack(
            children: [
          Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInput(label: 'Usuario',placeholder: 'usuario123', controller: userController),
                const SizedBox(height: 20),
                CustomInput(
                  label: 'Contraseña',
                  placeholder: '******',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                FilledButton(
                  child: const Text('Ingresar'),
                  onPressed: () async {
                    final succes = await loginController.login(
                      userController.text,
                      passwordController.text,
                    );
                    if (succes) {
                      print('login exitoso'); // redirect to homepage
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => ContentDialog(
                          title: const Text('Error inicio de sesion '),
                          content: const Text('Credenciales inválidas'),
                          actions: [
                            FilledButton(
                              child: const Text('Cerrar'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                ToggleSwitch(
                  checked: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (_) => Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  ).toggleTheme(),
                ),
              ],
            ),
          ),
        ),
        //text version app
        Align(alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'V 1.0.0',
            style: TextStyle(
              fontSize: 12,
              color: themeProvider.isDarkMode ? Colors.white.withOpacity(0.7) : Colors.black.withOpacity(0.7)
            ),
          ),
        ),)
            ],
          )
          ),
        )
    );
  }
}
