import '../mappers/versus_mapper.dart';
import '../../domain/entities/versus_entity.dart';
import '../../domain/repositories/versus_repository.dart';
import '../datasources/versus_dao.dart';
import 'package:drift/drift.dart';

class VersusRepositoryImpl implements VersusRepository {
  final VersusDao versusDao;

  VersusRepositoryImpl({required this.versusDao});

  @override
  Future<int> create(VersusEntity versus) {
    final comp = VersusMapper.toCompanion(versus);

    return versusDao.insert(
      comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> createBatch(List<VersusEntity> versusList) {
    final companions = versusList.map((e) {
      final comp = VersusMapper.toCompanion(e);
      return comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );
    }).toList();

    return versusDao.insertBatch(companions);
  }

  @override
  Future<bool> update(VersusEntity versus) {
    final comp = VersusMapper.toCompanion(versus);

    return versusDao.update(comp.copyWith(
      updatedAt: Value(DateTime.now()),
    ));
  }

  @override
  Future<int> delete(int id) {
    return versusDao.delete(id);
  }

  @override
  Future<void> deleteAllByGroup(int groupId) {
    return versusDao.deleteAllByGroup(groupId);
  }

  @override
  Future<VersusEntity?> getById(int id) async {
    final data = await versusDao.getById(id);
    if (data == null) return null;
    return VersusMapper.fromData(data);
  }

  @override
  Future<List<VersusEntity>> getByGroupId(int groupId) async {
    final list = await versusDao.getByGroupId(groupId);
    return list.map(VersusMapper.fromData).toList();
  }

  @override
  Future<List<VersusEntity>> getByGroupAndRound(int groupId, int bracketRound) async {
    final list = await versusDao.getByGroupAndRound(groupId, bracketRound);
    return list.map(VersusMapper.fromData).toList();
  }

  @override
  Future<List<VersusEntity>> getByTournamentId(int tournamentId) async {
    final list = await versusDao.getByTournamentId(tournamentId);
    return list.map(VersusMapper.fromData).toList();
  }

  @override
  Stream<List<VersusEntity>> watchByGroupId(int groupId) {
    return versusDao.watchByGroupId(groupId).map(
      (list) => list.map(VersusMapper.fromData).toList(),
    );
  }

  @override
  Stream<List<VersusEntity>> watchByGroupAndRound(int groupId, int bracketRound) {
    return versusDao.watchByGroupAndRound(groupId, bracketRound).map(
      (list) => list.map(VersusMapper.fromData).toList(),
    );
  }

  @override
  Future<bool> updateState(int versusId, String state) {
    return versusDao.updateState(versusId, state);
  }

  @override
  Future<bool> setWinner(int versusId, int winnerInscriptionId) {
    return versusDao.setWinner(versusId, winnerInscriptionId);
  }

  @override
  Future<void> swapParticipants({
    required int versusIdA,
    required String slotA,
    required int versusIdB,
    required String slotB,
  }) {
    return versusDao.swapParticipants(
      versusIdA: versusIdA,
      slotA: slotA,
      versusIdB: versusIdB,
      slotB: slotB,
    );
  }

  @override
  Future<bool> isRoundComplete(int groupId, int bracketRound) {
    return versusDao.isRoundComplete(groupId, bracketRound);
  }

  @override
  Future<int> getMaxBracketRound(int groupId) {
    return versusDao.getMaxBracketRound(groupId);
  }

  @override
  Future<bool> updateRoundState(int groupId, int bracketRound, String roundState) {
    return versusDao.updateRoundState(groupId, bracketRound, roundState);
  }
}
