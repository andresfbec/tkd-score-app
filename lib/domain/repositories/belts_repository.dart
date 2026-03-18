import '../entities/belts_entity.dart';

abstract class BeltsRepository {
  Future<List<BeltsEntity>> getAll();
  Future<BeltsEntity?> getById(int id);
}
