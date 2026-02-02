import 'package:tkd_score/data/mappers/users_mapper.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_dao.dart';
import '../../domain/entities/user_entity.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDao dao;
  UserRepositoryImpl(this.dao);

  @override
  Future<int> create(String user, String password, int headquartersId) {
    return dao.insert(
      username: user,
      password: password,
      headquartersId: headquartersId,
    );
  }

  @override
  Future<int> update(int id, String user, String password, int headquartersId) {
    return dao.update(
      id: id,
      username: user,
      password: password,
      headquartersId: headquartersId,
    );
  }

  @override
  Future<int> delete(int id) {
    return dao.delete(id);
  }

  @override
  Future<List<UserEntity>> getAll() async {
    final result = await dao.findAll();
    return result.map(UsersMapper.fromMap).toList();
  }

  @override
  Future<UserEntity?> getById(int id) async {
    final map = await dao.findById(id);
    return map != null ? UsersMapper.fromMap(map) : null;
  }

  @override
  Future<String?> getUsernameById(String username) async {
    final map = await dao.getByUsername(username);
    return map != null ? map['password'] as String : null;
  }

  @override
  Future<UserEntity?> find({String? username, int? headquartersId}) async {
    final filters = <String, dynamic>{};

    if (username != null) filters['username'] = username;
    if (headquartersId != null) filters['headquartersId'] = headquartersId;

    final result = await dao.query(filters: filters);
    return result != null ? UsersMapper.fromMap(result) : null;
  }
}
