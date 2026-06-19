import '../../entities/inscriptions_entity.dart';
import '../../repositories/inscriptions_repository.dart';

class UpdateInscription {
  final InscriptionsRepository repository;

  UpdateInscription(this.repository);

  Future<bool> call(InscriptionsEntity inscription) async {
    if (inscription.id == null) {
      throw Exception('El ID de la inscripción es requerido para actualizar');
    }

    // Verificar que exista
    final existing = await repository.getById(inscription.id!);
    if (existing == null) {
      throw Exception('La inscripción con ID ${inscription.id} no existe');
    }

    return await repository.update(inscription);
  }
}
