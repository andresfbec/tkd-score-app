import '../../entities/inscriptions_entity.dart';
import '../../repositories/inscriptions_repository.dart';

class WatchInscriptions {
  final InscriptionsRepository repository;

  WatchInscriptions(this.repository);

  Stream<List<InscriptionsEntity>> call({
    int? tournamentId,
    int? studentId,
    int? groupId,
    bool onlyActive = true,
  }) {
    return repository.watchInscriptions(
      tournamentId: tournamentId,
      studentId: studentId,
      groupId: groupId,
      onlyActive: onlyActive,
    );
  }
}
