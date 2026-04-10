import '../../domain/entities/belts_entity.dart';
import '../../domain/repositories/belts_repository.dart';

import '../../core/config/db/database.dart';

/*
Caso excepcional en el que no se immplementa un dao especifico para el repositorio, 
porque la lógica de acceso a datos es muy simple y no justifica la creación de una capa adicional. 
En este caso, el repositorio se encarga directamente de consultar la base de datos usando 
Drift para obtener los cinturones.

Es un atajo
*/

// data/repositories_impl/belts_repository_impl.dart
class BeltsRepositoryImpl implements BeltsRepository {
  final AppDatabase db;
  BeltsRepositoryImpl(this.db);

  @override
  Future<List<BeltsEntity>> getAll() async {
    final results = await db.select(db.belts).get();
    return results.map((row) => BeltsEntity(
      id: row.id,
      name: row.name,
      primaryColor: row.primaryColor,
      secondaryColor: row.secondaryColor,
    )).toList();
  }

  @override
  Future<BeltsEntity?> getById(int id) async {
    final query = db.select(db.belts)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return BeltsEntity(
      id: row.id,
      name: row.name,
      primaryColor: row.primaryColor,
      secondaryColor: row.secondaryColor,
    );
  }
}
