import '../../domain/entities/point_types_entity.dart';
import '../../domain/repositories/point_types_repository.dart';
import '../../core/config/db/database.dart';

class PointTypesRepositoryImpl implements PointTypesRepository {
  final AppDatabase db;
  PointTypesRepositoryImpl(this.db);

  @override
  Future<List<PointTypesEntity>> getAll() async {
    final results = await db.select(db.pointTypes).get();
    return results.map((row) => PointTypesEntity(
      id: row.id,
      name: row.name,
      pointsValue: row.pointsValue,
      bodyZone: row.bodyZone,
      techniqueType: row.techniqueType,
      isPenalty: row.isPenalty,
    )).toList();
  }

  @override
  Future<PointTypesEntity?> getById(int id) async {
    final query = db.select(db.pointTypes)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return PointTypesEntity(
      id: row.id,
      name: row.name,
      pointsValue: row.pointsValue,
      bodyZone: row.bodyZone,
      techniqueType: row.techniqueType,
      isPenalty: row.isPenalty,
    );
  }
}
