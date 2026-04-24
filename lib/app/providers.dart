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
import '../core/config/containers/dependency_tournament.dart';
import '../presentation/controllers/students_controller.dart';
import '../presentation/controllers/tournaments_controller.dart';
import '../presentation/controllers/combat_settings_controller.dart';
import '../presentation/controllers/inscriptions_controller.dart';
import '../core/config/containers/dependency_combat_settings.dart';
import '../core/config/containers/dependency_inscriptions.dart';
import 'ui_state_provider.dart';

class AppProviders {
  static Future<List<ChangeNotifierProvider>> init() async {
    // Inicializaciones necesarias
    await InjectionUser.init();


    final containerUser = InjectionUser();
    final containerHeadquarters = InjectionHeadquarters();
    final containerStudents = InjectionStudents();
    final containerTournament = InjectionTournament();
    final containerCombatSettings = InjectionCombatSettings();
    final containerInscriptions = InjectionInscriptions();

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
      ChangeNotifierProvider<TournamentsController>(
        create: (_) => TournamentsController(
          containerTournament.createTournament,
          containerTournament.updateTournament,
          containerTournament.deleteTournament,
          containerTournament.findTournaments,
          containerTournament.watchTournaments,
          containerTournament.startTournament,
        )..startListening(),
      ),
      ChangeNotifierProvider<StudentsController>(
        create: (_) => StudentsController(
          createUseCase: containerStudents.createStudent,
          updateUseCase: containerStudents.updateStudent,
          deleteUseCase: containerStudents.deleteStudent,
          watchUseCase: containerStudents.watchStudents,
        )..startListening(),
      ),
      ChangeNotifierProvider<CombatSettingsController>(
        create: (_) => CombatSettingsController(
          createUseCase: containerCombatSettings.createCombatSetting,
          updateUseCase: containerCombatSettings.updateCombatSetting,
          deleteUseCase: containerCombatSettings.deleteCombatSetting,
          watchUseCase: containerCombatSettings.watchCombatSettings,
          getByTournamentIdUseCase: containerCombatSettings.getCombatSettingByTournamentId,
          getByIdUseCase: containerCombatSettings.getCombatSettingById,
          syncUseCase: containerTournament.syncTournamentSetupPhase,
        ), // No usamos ..startListening() a menos que lo requieras globalmente.
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
      ChangeNotifierProvider<InscriptionsController>(
        create: (_) => InscriptionsController(
          createUseCase: containerInscriptions.createInscription,
          deleteUseCase: containerInscriptions.deleteInscription,
          getByTournamentUseCase: containerInscriptions.getInscriptionsByTournament,
        ),
      ),
    ];
  }
}
