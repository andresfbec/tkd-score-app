import '../../domain/entities/headquarters_entity.dart';
import '../../domain/repositories/headquarters_repository.dart';
import '../datasources/headquarters_dao.dart';
import '../mappers/headquarters_mapper.dart';

class HeadquartersRepositoryImpl implements HeadquartersRepository {
  final HeadquartersDao dao;

  HeadquartersRepositoryImpl(this.dao);

  @override
  Future<int> create(HeadquartersEntity headquarters) {
    return dao.insert(
      name: headquarters.name,
      address: headquarters.address,
      city: headquarters.city,
      phone: headquarters.phoneNumber,
    );
  }

  @override
  Future<List<HeadquartersEntity>> getAll() async {
    final result = await dao.findAll();
    return result.map(HeadquartersMapper.fromMap).toList();
  }

  @override
  Future<HeadquartersEntity?> getById(int id) async {
    final map = await dao.findById(id);
    return map != null ? HeadquartersMapper.fromMap(map) : null;
  }
}
