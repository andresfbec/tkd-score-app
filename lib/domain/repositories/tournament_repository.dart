import '../entities/tournament_entity.dart';

abstract class TournamentRepository {
  Future<int> create(TournamentEntity tournament);
  Future<bool> update(TournamentEntity tournament);
  Future<int> delete(int id);
  Future<List<TournamentEntity>> getAll();
  Future<TournamentEntity?> getById(int id);
  Future<List<TournamentEntity>> find({
    String? name,
    String? location,
    String? status,
    DateTime? dateStart,
  });
  Stream<List<TournamentEntity>> watchAll();
  Future<void> syncSetupPhase(int tournamentId);
}
