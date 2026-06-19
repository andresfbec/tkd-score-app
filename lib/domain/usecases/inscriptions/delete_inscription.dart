import '../../repositories/inscriptions_repository.dart';

class DeleteInscription {
  final InscriptionsRepository repository;

  DeleteInscription(this.repository);

  Future<int> call(int id) async {
    // Validar existencia antes de borrar (opcional, pero recomendado por el patrón del proyecto)
    final existing = await repository.getById(id);
    if (existing == null) {
      throw Exception('La inscripción con ID $id no existe');
    }

    return await repository.delete(id);
  }
}
