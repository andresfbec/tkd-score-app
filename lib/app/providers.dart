// lib/app/providers.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/controllers/headquarters_controller.dart';
import '../../presentation/controllers/user_controller.dart';
import '../../presentation/controllers/login_controller.dart';
import '../../core/theme/theme_provider.dart';
import '../../core/config/dependencia_headquarts.dart';
import '../../core/config/dependencia_user.dart';

class AppProviders {
  static Future<List<ChangeNotifierProvider>> init() async {
    // Inicializaciones necesarias
    await InjectionUser.init();
    await InjectionHeadquart.init();

    final containerUser = InjectionUser();
    final containerHeadquarts = InjectionHeadquart();

    return [
      // ThemeProvider 
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),
      ),

      // LoginController 
      ChangeNotifierProvider<LoginController>(
        create: (_) => LoginController(
          containerUser.loginUser,
        ),
      ),

      ChangeNotifierProvider<HeadquartersController>(
        create: (_) => HeadquartersController(
          containerHeadquarts.createHeadquart,
          containerHeadquarts.headquartersRepository,
          containerHeadquarts.getHeadquart,
        )..loadHeadquarters(),
      ),
      
      ChangeNotifierProvider<UserController>(
        create: (_) => UserController(
          containerUser.createUser,
          containerUser.userRepository,
        )..loadUsers(),
      ),
    ];
  }
}