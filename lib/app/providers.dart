// lib/app/providers.dart
import 'package:provider/provider.dart';

import '../../presentation/controllers/headquarters_controller.dart';
import '../presentation/controllers/users_controller.dart';
import '../../presentation/controllers/login_controller.dart';
import '../../core/theme/theme_provider.dart';
import '../core/config/containers/dependency_headquarters.dart';
import '../core/config/containers/dependency_user.dart';
import '../presentation/controllers/session_controller.dart';
import '../core/config/containers/dependency_students.dart';
import '../presentation/controllers/students_controller.dart';
import 'ui_state_provider.dart';

class AppProviders {
  static Future<List<ChangeNotifierProvider>> init() async {
    // Inicializaciones necesarias
    await InjectionUser.init();


    final containerUser = InjectionUser();
    final containerHeadquarters = InjectionHeadquarters();
    final containerStudents = InjectionStudents();

    return [
      // ThemeProvider
      ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),

      // UIStateProvider (para manejar estados de UI como modales, paneles, etc.)
      ChangeNotifierProvider<UIStateProvider>(create: (_) => UIStateProvider()),

      // LoginController
      ChangeNotifierProvider<LoginController>(
        create: (_) => LoginController(
          containerUser.loginUser,
          containerUser.sessionController,
        ),
      ),

      ChangeNotifierProvider<HeadquartersController>(
        create: (_) => HeadquartersController(
          containerHeadquarters.createHeadquarter,
          containerHeadquarters.updateHeadquarter,
          containerHeadquarters.deleteHeadquarter,
          containerHeadquarters.getAllHeadquarters,
          containerHeadquarters.findHeadquarters,
          containerHeadquarters.watchHeadquarters,
        )..startListening(), // empieza a escuchar el stream al crear el controller
      ),
      ChangeNotifierProvider<StudentsController>(
        create: (_) => StudentsController(
          createUseCase: containerStudents.createStudent,
          updateUseCase: containerStudents.updateStudent,
          deleteUseCase: containerStudents.deleteStudent,
          watchUseCase: containerStudents.watchStudents,
        )..startListening(),
      ),
      ChangeNotifierProvider<UserController>(
        create: (_) => UserController(
          containerUser.createUser,
          containerUser.userRepository,
        )..loadUsers(),
      ),
      ChangeNotifierProvider<SessionController>(
        create: (_) => containerUser.sessionController,
      ),
    ];
  }
}
