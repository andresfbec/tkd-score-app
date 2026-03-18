import 'package:drift/drift.dart';
import '../../domain/entities/headquarters_entity.dart';
import '../../core/config/db/database.dart';
import '../../domain/repositories/headquarters_repository.dart';
import '../datasources/headquarters_dao.dart';
import '../mappers/headquarters_mapper.dart';
import '../../core/constants/fields.dart';

class HeadquartersRepositoryImpl implements HeadquartersRepository {
  final HeadquartersDao dao;

  HeadquartersRepositoryImpl(this.dao);

  @override
  Future<int> create(HeadquartersEntity headquarters) {
    final comp = HeadquartersCompanion(
      address: Value(headquarters.address),
      name: Value(headquarters.name),
      city: Value(headquarters.city),
      phone: Value(headquarters.phoneNumber),
      synchronized: Value(0),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    );
    return dao.insert(comp);
  }

  @override
  Future<bool> update(HeadquartersEntity headquarters) {
    final comp = HeadquartersCompanion(
      id: Value(headquarters.id!),
      address: Value(headquarters.address),
      name: Value(headquarters.name),
      city: Value(headquarters.city),
      phone: Value(headquarters.phoneNumber),
      updatedAt: Value(DateTime.now()),
    );
    return dao.update(comp);
  }

  @override
  Future<int> delete(int id) {
    return dao.delete(id);
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

  @override
  Future<List<HeadquartersEntity>> find({
    String? name,
    String? city,
    String? address,
  }) async {
    final data = await dao.query(
      filter: HeadquarterFilter(name: name, address: address, city: city),
    );

    return data.map(HeadquartersMapper.fromMap).toList();
  }
}
