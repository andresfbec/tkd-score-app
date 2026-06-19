import 'package:drift/drift.dart';
import '../../domain/entities/inscriptions_entity.dart';
import '../../domain/repositories/inscriptions_repository.dart';
import '../datasources/inscriptions_dao.dart';
import '../mappers/inscriptions_mapper.dart';

class InscriptionsRepositoryImpl implements InscriptionsRepository {
  final InscriptionsDao inscriptionsDao;

  InscriptionsRepositoryImpl({required this.inscriptionsDao});

  @override
  Future<int> create(InscriptionsEntity inscription) {
    final comp = InscriptionsMapper.toCompanion(inscription);
    
    return inscriptionsDao.insert(
      comp.copyWith(
        synchronized: const Value(0),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<bool> update(InscriptionsEntity inscription) {
    final comp = InscriptionsMapper.toCompanion(inscription);
    
    return inscriptionsDao.update(
      comp.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> setGroupId(int inscriptionId, int? groupId) {
    return inscriptionsDao.setGroupId(inscriptionId, groupId);
  }

  @override
  Future<int> delete(int id) {
    return inscriptionsDao.delete(id);
  }

  @override
  Stream<List<InscriptionsEntity>> watchInscriptions({
    int? tournamentId,
    int? studentId,
    int? groupId,
    bool onlyActive = true,
  }) {
    // El DAO ya retorna List<InscriptionsEntity> directamente según mi última edición
    return inscriptionsDao.watchInscriptions(
      tournamentId: tournamentId,
      studentId: studentId,
      groupId: groupId,
      onlyActive: onlyActive,
    );
  }

  @override
  Future<InscriptionsEntity?> getById(int id) async {
    return await inscriptionsDao.getById(id);
  }

  @override
  Future<List<InscriptionsEntity>> getByTournament(int tournamentId) async {
    return await inscriptionsDao.getInscriptionsByTournament(tournamentId);
  }
}
