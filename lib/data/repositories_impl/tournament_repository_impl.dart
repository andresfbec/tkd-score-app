import 'package:drift/drift.dart';

import '../../domain/entities/tournament_entity.dart';
import '../../domain/repositories/tournament_repository.dart';
import '../datasources/tournament_dao.dart';
import '../mappers/tournament_mapper.dart';
import '../../core/constants/fields.dart';

class TournamentRepositoryImpl implements TournamentRepository {
  final TournamentDao dao;

  TournamentRepositoryImpl(this.dao);

  @override
  Future<int> create(TournamentEntity tournament) {
    final comp = TournamentMapper.toCompanion(tournament);
    return dao.insert(
      comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<bool> update(TournamentEntity tournament) {
    final comp = TournamentMapper.toCompanion(tournament);
    return dao.update(
      comp.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<int> delete(int id) {
    return dao.delete(id);
  }

  @override
  Future<List<TournamentEntity>> getAll() async {
    final result = await dao.findAll();
    return result.map(TournamentMapper.fromData).toList();
  }

  @override
  Future<TournamentEntity?> getById(int id) async {
    final row = await dao.findById(id);
    return row != null ? TournamentMapper.fromData(row) : null;
  }

  @override
  Future<List<TournamentEntity>> find({
    String? name,
    String? location,
    String? status,
    DateTime? dateStart,
  }) async {
    final data = await dao.query(
      filter: TournamentFilter(
        name: name,
        location: location,
        status: status,
        dateStart: dateStart,
      ),
    );
    return data.map(TournamentMapper.fromData).toList();
  }

  @override
  Stream<List<TournamentEntity>> watchAll() {
    return dao.watchAll().map(
          (data) => data.map(TournamentMapper.fromData).toList(),
        );
  }
}
