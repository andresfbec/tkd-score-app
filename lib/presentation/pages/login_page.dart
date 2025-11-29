import 'package:fluent_ui/fluent_ui.dart';
import 'package:tkd_score/core/theme/theme_provider.dart';
import '../controllers/login_controller.dart';
import '../widgets/custom_input.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final loginController = LoginController();

    return NavigationView(
      content: ScaffoldPage(
        header: const PageHeader(title: Text('Login')),
        content: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInput(label: 'Email', controller: emailController),
                const SizedBox(height: 20),
                CustomInput(
                  label: 'Contraseña',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                FilledButton(
                  child: const Text('Ingresar'),
                  onPressed: () async {
                    final succes = await loginController.login(
                      emailController.text,
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
      ),
    );
  }
}
