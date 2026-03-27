import 'package:drift/drift.dart';
import '../../domain/entities/headquarters_entity.dart';
import '../../domain/repositories/headquarters_repository.dart';
import '../datasources/headquarters_dao.dart';
import '../mappers/headquarters_mapper.dart';
import '../../core/constants/fields.dart';

class HeadquartersRepositoryImpl implements HeadquartersRepository {
  final HeadquartersDao dao;

  HeadquartersRepositoryImpl(this.dao);

  @override
  Future<int> create(HeadquartersEntity headquarters) {
    final comp = HeadquartersMapper.toCompanion(
      headquarters,
    ); // usamos el mapper para convertir la entidad a companion
    return dao.insert(
      comp.copyWith(
        synchronized: const Value(
          0,
        ), // metadatos de permanencia y sincronización
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<bool> update(HeadquartersEntity headquarters) {
    final comp = HeadquartersMapper.toCompanion(
      headquarters,
    ); // convertimos la entidad a companion
    return dao.update(
      comp.copyWith(
        updatedAt: Value(DateTime.now()),
      ), // actualizamos la fecha de actualización)
    );
  }

  @override
  Future<int> delete(int id) {
    return dao.delete(id);
  }

  @override
  Future<List<HeadquartersEntity>> getAll() async {
    final result = await dao.findAll();
    return result.map(HeadquartersMapper.fromData).toList();
  }

  @override
  Future<HeadquartersEntity?> getById(int id) async {
    final map = await dao.findById(id);
    return map != null ? HeadquartersMapper.fromData(map) : null;
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

    return data.map(HeadquartersMapper.fromData).toList();
  }

  @override
  Stream<List<HeadquartersEntity>> watchAll() { // Usa el metodo watchAll del DAO para escuchar cambios en la tabla de sedes y mapear los resultados a entidades
    return dao.watchAll().map(
      (data) => data.map(HeadquartersMapper.fromData).toList(),
    );
  }
}
