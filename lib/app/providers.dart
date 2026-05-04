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
import '../presentation/controllers/judges_controller.dart';
import '../presentation/controllers/belts_controller.dart';
import '../core/config/containers/dependency_combat_settings.dart';
import '../core/config/containers/dependency_inscriptions.dart';
import '../core/config/containers/dependency_judges.dart';
import '../core/config/containers/dependency_belts.dart';
import '../core/config/containers/dependency_groups.dart';
import '../presentation/controllers/groups_controller.dart';
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
    final containerJudges = InjectionJudges();
    final containerBelts = InjectionBelts();
    final containerGroups = InjectionGroups();

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
          syncTournamentSetupPhaseUseCase: containerTournament.syncTournamentSetupPhase,
        ),
      ),
      ChangeNotifierProvider<JudgesController>(
        create: (_) => JudgesController(
          createUseCase: containerJudges.createJudge,
          updateUseCase: containerJudges.updateJudge,
          deleteUseCase: containerJudges.deleteJudge,
          watchUseCase: containerJudges.watchJudges,
          assignToTournamentUseCase: containerJudges.assignJudgeToTournament,
          removeFromTournamentUseCase: containerJudges.removeJudgeFromTournament,
          watchByTournamentUseCase: containerJudges.watchJudgesByTournament,
        )..startListening(),
      ),
      ChangeNotifierProvider<BeltsController>(
        create: (_) => BeltsController(
          getAllUseCase: containerBelts.getAllBelts,
        )..loadBelts(),
      ),
      ChangeNotifierProvider<GroupsController>(
        create: (_) => GroupsController(
          generateStandardGroupsUseCase: containerGroups.generateStandardGroups,
          autoAssignInscriptionsUseCase: containerGroups.autoAssignInscriptions,
          watchTournamentGroupsUseCase: containerGroups.watchTournamentGroups,
          deleteGeneratedGroupsUseCase: containerGroups.deleteGeneratedGroups,
          updateInscriptionGroupUseCase: containerGroups.updateInscriptionGroup,
          createGroupUseCase: containerGroups.createGroup,
          deleteGroupUseCase: containerGroups.deleteGroup,
          syncTournamentSetupPhaseUseCase: containerTournament.syncTournamentSetupPhase,
        ),
      ),
    ];
  }
}
