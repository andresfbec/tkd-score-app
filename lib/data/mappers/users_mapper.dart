import '../../domain/entities/users_entity.dart';
import '../../core/config/db/database.dart';

class UsersMapper {
  static UserEntity fromMap(User map) {
    return UserEntity(
      id: map.id,
      username: map.username,
      password: null,
      headquarterId: map.headquarterId,
    );
  }
}
