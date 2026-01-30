import '../entities/headquarters_entity.dart';

abstract class HeadquartersRepository {
  Future<int> create(HeadquartersEntity headquarters);
  Future<List<HeadquartersEntity>> getAll();
  Future<HeadquartersEntity?> getById(int id);
}
