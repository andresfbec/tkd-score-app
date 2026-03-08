import '../entities/headquarters_entity.dart';

abstract class HeadquartersRepository {
  Future<int> create(HeadquartersEntity headquarters);
  Future<bool> update(HeadquartersEntity headquarters);
  Future<List<HeadquartersEntity>?> find({
    String? name,
    String? city,
    String? address,
  });
  Future<List<HeadquartersEntity>> getAll();
  Future<HeadquartersEntity?> getById(int id);
  Future<int> delete(int id);
}
