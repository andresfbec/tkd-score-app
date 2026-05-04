import '../entities/inscriptions_entity.dart';

abstract class InscriptionsRepository {
  Future<int> create(InscriptionsEntity inscription);
  Future<bool> update(InscriptionsEntity data);
  Future<void> setGroupId(int inscriptionId, int? groupId);
  Future<int> delete(int id);
  
  /// Observa las inscripciones con filtros opcionales
  Stream<List<InscriptionsEntity>> watchInscriptions({
    int? tournamentId,
    int? studentId,
    int? groupId,
    bool onlyActive = true,
  });

  /// Obtiene una inscripción por su ID
  Future<InscriptionsEntity?> getById(int id);

  /// Obtiene todas las inscripciones de un torneo
  Future<List<InscriptionsEntity>> getByTournament(int tournamentId);
}
