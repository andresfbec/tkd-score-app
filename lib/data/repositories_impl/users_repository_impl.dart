import 'package:drift/drift.dart';
import 'package:tkd_score/data/mappers/users_mapper.dart';
import '../../core/config/db/database.dart';
import '../../domain/repositories/users_repository.dart';
import '../datasources/users_dao.dart';
import '../../domain/entities/users_entity.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDao dao;
  UserRepositoryImpl(this.dao);

  @override
  Future<int> create(UserEntity user) {
    final comp = UsersCompanion(
      username: Value(user.username),
      password: Value(user.password!),
      headquarterId: Value(user.headquarterId),
      synchronized: Value(0),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    );
    return dao.insert(comp);
  }

  @override
  Future<bool> update(UserEntity data) {
    final comp = UsersCompanion(
      id: Value(data.id!),
      username: Value(data.username),
      headquarterId: Value(data.headquarterId),
      updatedAt: Value(DateTime.now()),
    );
    return dao.update(comp);
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
  Future<UserEntity?> getUsernameById(String username) async {
    final map = await dao.getByUsername(username);
    return map != null ? UsersMapper.fromMap(map) : null;
  }

  @override
  Future<List<UserEntity>> getUserheadquarter(int pkHeadquarter) async {
    final result = await dao.getByheadquater(pkHeadquarter);
    return result.map(UsersMapper.fromMap).toList();
  }
}
