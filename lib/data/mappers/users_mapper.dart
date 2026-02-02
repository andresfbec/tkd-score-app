import '../../domain/entities/user_entity.dart';

class UsersMapper {
  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as int,
      username: map['username'],
      headquarters: map['headquarterId'] as int,
    );
  }
}
