import '../mappers/belts_mapper.dart';
import '../../domain/entities/belts_entity.dart';
import '../../domain/repositories/belts_repository.dart';
import '../datasources/belts_dao.dart';

class BeltsRepositoryImpl implements BeltsRepository {
  final BeltsDao dao;
  BeltsRepositoryImpl(this.dao);
  @override
  Future<List<BeltsEntity>> getAll() async {
    final result = await dao.findAll();
    return result.map(BeltsMapper.fromMap).toList();
  }

  @override
  Future<BeltsEntity?> getById(int id) async {
    final map = await dao.findById(id);
    return map != null ? BeltsMapper.fromMap(map) : null;
  }
}
