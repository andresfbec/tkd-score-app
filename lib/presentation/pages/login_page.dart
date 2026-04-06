import 'package:fluent_ui/fluent_ui.dart';
import 'package:tkd_score/core/theme/theme_provider.dart';
import '../controllers/login_controller.dart';
import 'package:provider/provider.dart';
import '../widgets/inputs/custom_input.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../app/routes.dart';
import '../../core/constants/app.dart';
import '../../core/enums/input_type.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final passwordController = TextEditingController();
    final loginController = context.watch<LoginController>();

    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return NavigationView(
      content: Stack(
        children: [
          // Fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_login.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Login Container Premium - SIN altura fija
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420), // Solo ancho máximo
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Acrylic(
                  blurAmount: 30,
                  luminosityAlpha: 0.25,
                  tint: isDark ? Colors.black : Colors.white,
                  tintAlpha: 0.55,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isDark
                            ? Colors.white.withOpacity(0.08)
                            : Colors.black.withOpacity(0.08),
                      ),
                    ),
                    // CAMBIO IMPORTANTE: SingleChildScrollView en lugar de Column
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Línea superior decorativa
                          Container(
                            width: 50,
                            height: 4,
                            decoration: BoxDecoration(
                              color: FluentTheme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          const SizedBox(height: 25),

                          // Logo
                          Image.asset(
                            'assets/images/logo.png',
                            width: 85,
                            height: 85,
                          ),

                          const SizedBox(height: 18),

                          Text(
                            'TKD Tournament Manager',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppTypography.displaySmall,
                              fontWeight: AppTypography.bold,
                              color: isDark
                                  ? Colors.white
                                  : const Color.fromARGB(255, 16, 45, 83),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'Accede a tu panel de gestión',
                            style: TextStyle(
                              fontSize: AppTypography.caption,
                              fontWeight: AppTypography.regular,
                              color: isDark
                                  ? Colors.white.withOpacity(0.7)
                                  : Colors.black.withOpacity(0.6),
                            ),
                          ),

                          const SizedBox(height: 25),

                          // Usuario
                          CustomInput(
                            label: 'Usuario',
                            type: InputType.text,
                            placeholder: 'Ingrese su usuario',
                            controller: userController,
                            errorText: loginController.userError,
                            prefixIcon: const Icon(
                              FluentIcons.contact,
                              size: AppTypography.iconMedium,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Password
                          CustomInput(
                            label: 'Contraseña',
                            type: InputType.password,
                            placeholder: '••••••••',
                            obscureText: true,
                            controller: passwordController,
                            errorText: loginController.passwordError,
                            prefixIcon: const Icon(
                              FluentIcons.lock,
                              size: AppTypography.iconMedium,
                            ),
                          ),

                          const SizedBox(height: 30),

                          SizedBox(
                            width: double.infinity,
                            height: 42,
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
                                      content: const Text(
                                        'Credenciales inválidas',
                                      ),
                                      actions: [
                                        FilledButton(
                                          child: const Text('Cerrar'),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    Routes.home,
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
          ),
          // Versión
          Align(
            alignment: Alignment.bottomRight,
            child: FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const SizedBox();
                final info = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'V ${info.version}+${info.buildNumber}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}