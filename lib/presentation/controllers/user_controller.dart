import 'package:flutter/foundation.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/users/create_user.dart';
import '../../domain/repositories/user_repository.dart';

class UserController extends ChangeNotifier {
  final CreateUser createUser;
  final UserRepository repository;

  UserController(this.createUser, this.repository);

  List<UserEntity> users = [];
  int _counter = 0; // testing de botón

  // CREATE  USERS
  Future<void> createUsers({
    required String username,
    required String password,
    required int headquartersId,
  }) async {
    final entity = UserEntity(
      id: 0,
      username: username,
      password: password,
      headquarterId: headquartersId,
    );

    await createUser.call(entity);
    await loadUsers();
  }

  // TESTEO BOTÓN CREATE  USERS COUNTER
  Future<void> createTestUsers() async {
    _counter++;

    await createUsers(
      username: 'Usuario$_counter',
      password: '12345678',
      headquartersId: 1,
    );
  }

  // READ
  Future<void> loadUsers() async {
    // Implementar la lógica para cargar usuarios si es necesario
    users = await repository.getAll();
    notifyListeners(); // CLAVE
  }
}
