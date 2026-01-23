import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../db/database.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserEntity> login({
    required String username,
    required String password,
  }) async {
    try {
      final Database db = await DatabaseConnection.getDatabase();

      final result = await db.query(
        'users',
        where: 'username = ? AND is_active = 1',
        whereArgs: [username],
        limit: 1,
      );

      if (result.isEmpty) {
        throw LoginFailure.userNotFound;
      }

      final userRow = result.first;

      if (userRow['password'] != password) {
        throw LoginFailure.wrongPassword;
      }

      // ⚠️ headquarters se resuelve después
      return UserEntity(
        id: userRow['id'] as int,
        username: userRow['username'] as String,
        headquarters: throw UnimplementedError(),
      );
    } catch (e) {
      if (e is LoginFailure) {
        rethrow;
      }
      throw LoginFailure.databaseError;
    }
  }
}
