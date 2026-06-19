import '../../entities/inscriptions_entity.dart';
import '../../repositories/inscriptions_repository.dart';
import '../../repositories/students_repository.dart';
import '../../repositories/tournament_repository.dart';

class CreateInscription {
  final InscriptionsRepository inscriptionsRepository;
  final StudentsRepository studentsRepository;
  final TournamentRepository tournamentRepository;

  CreateInscription(
    this.inscriptionsRepository,
    this.studentsRepository,
    this.tournamentRepository,
  );

  Future<int> call(InscriptionsEntity inscription) async {
    // 1. Validar que el estudiante exista
    final studentExists = await studentsRepository.getById(inscription.studentId);
    if (studentExists == null) {
      throw Exception('El estudiante con ID ${inscription.studentId} no existe');
    }

    // 2. Validar que el torneo exista
    final tournamentExists = await tournamentRepository.getById(inscription.tournamentId);
    if (tournamentExists == null) {
      throw Exception('El torneo con ID ${inscription.tournamentId} no existe');
    }

    // 3. Validar si ya existe una inscripción activa para este estudiante en este torneo
    // Usamos el stream y tomamos el primer valor (una lista)
    final existingInscriptions = await inscriptionsRepository.watchInscriptions(
      tournamentId: inscription.tournamentId,
      studentId: inscription.studentId,
      onlyActive: true,
    ).first;

    if (existingInscriptions.isNotEmpty) {
      throw Exception('El estudiante ya se encuentra inscrito en este torneo');
    }

    // 4. Persistencia
    return await inscriptionsRepository.create(inscription);
  }
}
