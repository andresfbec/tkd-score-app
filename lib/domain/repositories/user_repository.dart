import '../entities/user_entity.dart';

enum LoginFailure { userNotFound, wrongPassword, databaseError }

abstract class UserRepository {
  Future<int> create(UserEntity user);
  Future<bool> update(UserEntity data);
  Future<int> delete(int id);
  Future<List<UserEntity>> getAll();
  Future<UserEntity?> getById(int id);
  Future<UserEntity?> getUsernameById(String username);
  Future<List<UserEntity>> getUserheadquarter(int pkHeadquarter);
}
