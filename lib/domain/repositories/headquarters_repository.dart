import '../entities/headquarters_entity.dart';

abstract class HeadquartersRepository {
  Future<int> create(HeadquartersEntity headquarters);
  Future<int> update(HeadquartersEntity headquarters);
  Future<HeadquartersEntity?> find({
    String? name,
    String? address,
    String? city,
    String? phone,
  });
  Future<List<HeadquartersEntity>> getAll();
  Future<HeadquartersEntity?> getById(int id);
  Future<int> delete(int id);
}
