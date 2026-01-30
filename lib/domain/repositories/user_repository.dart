import '../entities/user_entity.dart';

enum LoginFailure {
  userNotFound,
  wrongPassword,
  databaseError,
}

abstract class UserRepository {
  /// Intenta autenticar un usuario localmente
  ///
  /// Retorna:
  /// - UserEntity si el login es exitoso
  /// - Lanza LoginFailure si falla
  Future<UserEntity> login({
    required String username,
    required String password,
  });
}


