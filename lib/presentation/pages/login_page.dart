import 'package:fluent_ui/fluent_ui.dart';
import 'package:tkd_score/core/theme/theme_provider.dart';
import '../controllers/login_controller.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_input.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final passwordController = TextEditingController();
    final loginController = LoginController();

    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return NavigationView(
      content: ScaffoldPage(
        content: Stack(
          children: [
            // Fondo con imagen
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/background_login.jpeg'),
                  fit: BoxFit.cover, // ajusta la imagen al tamaño de la pantalla
                ),
              ),
            ),

            // Panel central translúcido
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 450),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Acrylic(
                    luminosityAlpha: 0.12,
                    tint: isDark ? Colors.black : Colors.white,
                    tintAlpha: 0.75,
                    shadowColor: Colors.black.withOpacity(0.18),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 32),
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
                          const SizedBox(height: 10),
                          Text(
                            'TKD Tournament Manager',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : const Color.fromARGB(255, 61, 61, 61),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            label: 'Usuario',
                            placeholder: 'Ingrese su usuario',
                            controller: userController,
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            label: 'Contraseña',
                            placeholder: '••••••••',
                            obscureText: true,
                            controller: passwordController,
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: FilledButton(
                              child: const Text(
                                'Ingresar',
                                style: TextStyle(fontSize: 15),
                              ),
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
                                      content:
                                          const Text('Credenciales inválidas'),
                                      actions: [
                                        FilledButton(
                                          child: const Text('Cerrar'),
                                          onPressed: () =>
                                              Navigator.pop(context),
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
              ),
            ),
            // Versión en esquina inferior derecha
            Align(
              alignment: Alignment.bottomRight,
              child: FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const SizedBox();
                  final info = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'V ${info.version}+${info.buildNumber}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? Colors.white.withOpacity(0.7)
                            : Colors.white.withOpacity(0.7),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}