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
    return inscriptionsDao
        .watchInscriptions(
          tournamentId: tournamentId,
          studentId: studentId,
          groupId: groupId,
          onlyActive: onlyActive,
        )
        .map((list) => InscriptionsMapper.fromDataList(list));
  }

  @override
  Future<InscriptionsEntity?> getById(int id) async {
    final data = await inscriptionsDao.getInscriptionById(id);
    if (data == null) return null;
    return InscriptionsMapper.fromData(data);
  }

  @override
  Future<List<InscriptionsEntity>> getByTournament(int tournamentId) async {
    final data = await inscriptionsDao.getInscriptionsByTournament(tournamentId);
    return InscriptionsMapper.fromDataList(data);
  }
}
