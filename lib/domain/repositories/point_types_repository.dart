import '../entities/point_types_entity.dart';

abstract class PointTypesRepository {
  Future<List<PointTypesEntity>> getAll();
  Future<PointTypesEntity?> getById(int id);
}
