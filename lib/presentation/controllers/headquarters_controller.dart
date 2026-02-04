import 'package:flutter/foundation.dart';
import '../../domain/entities/headquarters_entity.dart';
import '../../domain/usecases/headquarters/create_headquart.dart';
import '../../domain/usecases/headquarters/get_headquart.dart';
import '../../domain/repositories/headquarters_repository.dart';

class HeadquartersController extends ChangeNotifier {
  final CreateHeadquart createHeadquart;
  final GetHeadquart getHeadquart;

  final HeadquartersRepository repository;

  HeadquartersController(
    this.createHeadquart,
    this.repository,
    this.getHeadquart,
  );

  List<HeadquartersEntity> headquarters = [];
  int _counter = 0; // testing de botón

  // CREATE  HEADQUARTERS
  Future<void> createHeadquarters({
    required String name,
    required String address,
    required String city,
    required String phone,
  }) async {
    final entity = HeadquartersEntity(
      id: 0,
      name: name,
      address: address,
      city: city,
      phoneNumber: phone,
    );

    await createHeadquart.call(entity);
    await loadHeadquarters();
  }

  // TESTEO BOTÓN CREATE  HEADQUARTERS COUNTER
  Future<void> createTestHeadquarters() async {
    _counter++;

    await createHeadquarters(
      name: 'Sede $_counter',
      address: 'Calle $_counter',
      city: 'Ciudad $_counter',
      phone: '3521458$_counter',
    );
  }

  // READ obtener todas las sedes
  Future<void> loadHeadquarters() async {
    headquarters = await getHeadquart.call();
    notifyListeners(); // CLAVE
  }

  Future<HeadquartersEntity?> getById(int id) {
    return repository.getById(id);
  }

  Future<void> deleteById(int id) async {
    await repository.deleteById(id);
    await loadHeadquarters();
  }

  Future<void> updateHeaderquarters({
    required int id,
    required String name,
    required String address,
    required String city,
    required String phone,
  }) async {
    final entity = HeadquartersEntity(
      id: id,
      name: name,
      address: address,
      city: city,
      phoneNumber: phone,
    );

    await repository.updateById(entity);
    await loadHeadquarters();
  }
}