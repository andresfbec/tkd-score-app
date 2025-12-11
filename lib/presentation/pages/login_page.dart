import 'package:fluent_ui/fluent_ui.dart';
import 'package:tkd_score/core/theme/theme_provider.dart';
import '../controllers/login_controller.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final passwordController = TextEditingController();
    final loginController = LoginController();

    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    final surfaceColor = isDark ? const Color(0xFF1F1F1F) : const Color(0xFFF5F5F5);
    final panelColor   = isDark ? const Color(0xFF232323) : Colors.white;

    return NavigationView(
      content: ScaffoldPage(
        content: Stack(
          children: [
            Container(color: surfaceColor),

            Center(
              child: ConstrainedBox(
                //  ancho máximo del cuadro
                constraints: const BoxConstraints(maxWidth: 450),
                child: Container(
                  //  padding interno para que se vea espacioso
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                  decoration: BoxDecoration(
                    color: panelColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withOpacity(0.06)
                          : Colors.black.withOpacity(0.06),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? Colors.black.withOpacity(0.45)
                            : Colors.black.withOpacity(0.08),
                        blurRadius: isDark ? 16 : 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/images/logo.png',
        width: 80,  
        height: 80,
      ),
    ),
    const SizedBox(height: 16),

    //  Título 
    Align(
      alignment: Alignment.center,
      child: Text(
        'TKD Tournament Manager',
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    ),
                      const SizedBox(height: 20),

                      CustomInput(
                        label: 'Usuario',
                        placeholder: 'Ej: admin',
                        controller: userController,
                      ),

                      const SizedBox(height: 25),

                       CustomInput(
                        label: 'Contraseña',
                        placeholder: '••••••••',
                        obscureText: true,
                        controller: passwordController,
                      ),


                      const SizedBox(height: 32),

                      SizedBox(
                        width: double.infinity,
                        height: 35, 
                        child: FilledButton(
                          child: const Text('Ingresar', style: TextStyle(fontSize: 15)),
                          onPressed: () async {
                            final succes = await loginController.login(
                              userController.text,
                              passwordController.text,
                            );
                            if (!succes) {
                              showDialog(
                                context: context,
                                builder: (context) => ContentDialog(
                                  title: const Text('Error inicio de sesión'),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),


            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'V 1.0.0',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? Colors.white.withOpacity(0.7)
                        : Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}