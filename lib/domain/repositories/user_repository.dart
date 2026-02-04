import '../entities/user_entity.dart';

enum LoginFailure { userNotFound, wrongPassword, databaseError }

abstract class UserRepository {
  /// Intenta autenticar un usuario localmente
  ///
  /// Retorna:
  /// - UserEntity si el login es exitoso
  /// - Lanza LoginFailure si falla
  Future<int> create(String user, String password, int headquartersId);
  Future<int> update(int id, String user, String password, int headquartersId);
  Future<int> delete(int id);
  Future<List<UserEntity>> getAll();
  Future<UserEntity?> getById(int id);
  Future<String?> getUsernameById(String username);
  Future<UserEntity?> find({String? username, int? headquartersId});
}
