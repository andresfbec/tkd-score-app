import '../../entities/combat_events_entity.dart';
import '../../repositories/combat_events_repository.dart';

class GetCombatEventById {
  final CombatEventsRepository repository;

  GetCombatEventById(this.repository);

  Future<CombatEventsEntity?> call(int id) async {
    return await repository.getById(id);
  }
}
