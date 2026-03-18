import 'package:flutter/foundation.dart';
import '../../domain/entities/headquarters_entity.dart';
import '../../domain/usecases/headquarters/create_headquart.dart';
import '../../domain/usecases/headquarters/update_headquart.dart'; // Importar
import '../../domain/usecases/headquarters/delete_headquart.dart'; // Importar
import '../../domain/usecases/headquarters/get_headquart.dart';
import '../../domain/repositories/headquarters_repository.dart';

class HeadquartersController extends ChangeNotifier {
  final CreateHeadquart createHeadquart;
  final UpdateHeadquart updateHeadquart; // Nuevo
  final DeleteHeadquart deleteHeadquart; // Nuevo
  final GetHeadquart getHeadquart;
  final HeadquartersRepository repository;

  HeadquartersController(
    this.createHeadquart,
    this.updateHeadquart, // Agregar
    this.deleteHeadquart, // Agregar
    this.repository,
    this.getHeadquart,
  );

  List<HeadquartersEntity> headquarters = [];
  int _counter = 0; // testing de botón
  HeadquartersEntity? _selectedHeadquarter; // Para edición

  // Getters
  HeadquartersEntity? get selectedHeadquarter => _selectedHeadquarter;

  // SELECT para editar
  void selectHeadquarterForEdit(HeadquartersEntity headquarters) {
    _selectedHeadquarter = headquarters;
    notifyListeners();
  }

  void clearSelected() {
    _selectedHeadquarter = null;
    notifyListeners();
  }

  // CREATE HEADQUARTERS
  Future<void> createHeadquarters({
    required String name,
    required String address,
    required String city,
    required String phone,
  }) async {
    _counter++;
    final entity = HeadquartersEntity(
      id: null,
      name: "$name$_counter",
      address: address,
      city: city,
      phoneNumber: phone,
    );

    await createHeadquart.call(entity);
    await loadHeadquarters();
  }

  // UPDATE HEADQUARTERS (NUEVO)
  Future<void> updateHeadquarters({
    required int id,
    required String name,
    required String address,
    required String city,
    required String phone,
  }) async {
    try {
      print('📝 Actualizando sede ID: $id');

      await updateHeadquart.call(
        id,
        name: name,
        address: address,
        city: city,
        phone: phone,
      );
      await loadHeadquarters();
      clearSelected(); // Limpiar selección después de actualizar

      print('✅ Sede actualizada correctamente');
    } catch (e) {
      print('❌ Error al actualizar: $e');
      rethrow;
    }
  }

  // DELETE HEADQUARTERS (NUEVO)
  Future<void> deleteHeadquarters(int id) async {
    try {
      print('🗑️ Eliminando sede ID: $id');

      await deleteHeadquart.call(id);
      await loadHeadquarters();

      // Si la sede eliminada era la seleccionada, limpiar selección
      if (_selectedHeadquarter?.id == id) {
        clearSelected();
      }

      print('✅ Sede eliminada correctamente');
    } catch (e) {
      print('❌ Error al eliminar: $e');
      rethrow;
    }
  }

  // TESTEO BOTÓN CREATE HEADQUARTERS COUNTER
  Future<void> createTestHeadquarters() async {
    _counter++;

    await createHeadquarters(
      name: 'Sede $_counter',
      address: 'Calle $_counter',
      city: 'Ciudad $_counter',
      phone: '3521458$_counter',
    );
  }

  // TESTEO BOTÓN UPDATE (NUEVO)
  Future<void> updateTestHeadquarters() async {
    if (headquarters.isEmpty) {
      print('❌ No hay sedes para actualizar');
      return;
    }

    // Tomar la primera sede para actualizar
    final sede = headquarters.first;
    _counter++;

    await updateHeadquarters(
      id: sede.id!,
      name: 'Sede Actualizada $_counter',
      address: 'Nueva dirección $_counter',
      city: sede.city,
      phone: sede.phoneNumber,
    );
  }

  // TESTEO BOTÓN DELETE (NUEVO)
  Future<void> deleteTestHeadquarters() async {
    if (headquarters.isEmpty) {
      print('❌ No hay sedes para eliminar');
      return;
    }

    // Eliminar la última sede
    final sede = headquarters.last;
    await deleteHeadquarters(sede.id!);
  }

  // READ
  Future<void> loadHeadquarters() async {
    headquarters = await getHeadquart.call();
    notifyListeners();
  }

  Future<HeadquartersEntity?> getById(int id) {
    return repository.getById(id);
  }

  // SEDE DE PRUEBA
  Future<void> crearSedeDePrueba() async {
    try {
      print('🚀 Creando sede de prueba...');

      final id = await createHeadquart.call(
        HeadquartersEntity(
          id: null,
          name: 'Mi Sede de Prueba ${DateTime.now().millisecondsSinceEpoch}',
          address: 'cra 147 a #132-53',
          phoneNumber: '3252545857',
          city: 'Bogotá',
        ),
      );

      print('✅ Sede creada con ID: $id');
      await loadHeadquarters();
    } catch (e) {
      print('❌ Error: $e');
    }
  }

  // MÉTODO PARA EDITAR RÁPIDO (NUEVO)
  Future<void> editarSedeRapido(int id) async {
    try {
      // Obtener la sede actual
      final sede = await getById(id);
      if (sede == null) {
        print('❌ Sede no encontrada');
        return;
      }

      // Crear versión modificada
      await updateHeadquarters(
        id: sede.id!,
        name: '${sede.name} (Editada)',
        address: sede.address,
        city: sede.city,
        phone: sede.phoneNumber,
      );

      print('✅ Sede editada rápidamente');
    } catch (e) {
      print('❌ Error: $e');
    }
  }

  // MÉTODO PARA ELIMINAR RÁPIDO (NUEVO)
  Future<void> eliminarSedeRapido(int id) async {
    try {
      await deleteHeadquarters(id);
      print('✅ Sede eliminada rápidamente');
    } catch (e) {
      print('❌ Error: $e');
    }
  }
}
