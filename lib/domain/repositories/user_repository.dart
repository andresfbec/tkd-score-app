import '../entities/user_entity.dart';

enum LoginFailure { userNotFound, wrongPassword, databaseError }

abstract class UserRepository {
  Future<int> create(String user, String password, int headquartersId);
  Future<int> update(UserEntity data);
  Future<int> updatePassword(UserEntity data, String password);
  Future<int> delete(int id);
  Future<List<UserEntity>> getAll();
  Future<UserEntity?> getById(int id);
  Future<Map<String, dynamic>?> getUsernameById(String username);
  Future<UserEntity?> find({String? username, int? headquartersId});
}
