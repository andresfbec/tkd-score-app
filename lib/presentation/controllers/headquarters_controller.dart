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

  // READ
  Future<void> loadHeadquarters() async {
    headquarters = await getHeadquart.call();
    notifyListeners(); // CLAVE
  }

  Future<HeadquartersEntity?> getById(int id) {
    return repository.getById(id);
  }  

  // la q si sirve 
  Future<void> crearSedeDePrueba() async {
    try {
      print('🚀 Creando sede de prueba...');
      
      // Usando el caso de uso que ya tienes inyectado
      final id = await createHeadquart.call(
        HeadquartersEntity(
          id: 50, // La BD asigna el ID automáticamente
          name: 'Mi Sede de Prueba2',
          address: 'cra 147 a #132-53',
          phoneNumber: '3252545857',
          city: 'Bogotá',
        ),
      );
      
      print('✅ Sede creada con ID: $id');
      
      // Recargar la lista para verla
      await loadHeadquarters();
      
    } catch (e) {
      print('❌ Error: $e');
    }
  }
}