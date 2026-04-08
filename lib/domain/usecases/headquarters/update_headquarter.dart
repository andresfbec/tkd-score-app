import 'package:drift/drift.dart';
import 'package:tkd_score/domain/entities/headquarters_entity.dart';
import '../../repositories/headquarters_repository.dart';
import '../../errors/exceptions.dart';

class UpdateHeadquarter {
  final HeadquartersRepository repository;

  UpdateHeadquarter(this.repository);

  Future<bool> call(
    int pk, {
    String? name,
    String? address,
    String? city,
    String? phone,
    String? master, 
  }) async {
    final existing = await repository.getById(pk);

    if (existing == null) {
      throw HeadquarterNotFoundException();
    }
    final updatedHeadquarters = HeadquartersEntity(
      id: pk,
      name: name ?? existing.name,
      address: address ?? existing.address,
      city: city ?? existing.city,
      phoneNumber: phone ?? existing.phoneNumber,
      master: master ?? existing.master, 
    );

    final nameChanged = name != null && name != existing.name;
    final cityChanged = city != null && city != existing.city;

    if (nameChanged || cityChanged) { // Si no cambiaron ninguno de los dos no hace falta validar duplicados 
      final exists = await repository.find(
      // validacion por si al modificar el nombre o la ciudad se genera un duplicado con otro ya existente
      name: updatedHeadquarters.name,
      city: updatedHeadquarters.city,
    );

    final isDuplicate = exists.any((h) => h.id != pk);

    if (isDuplicate) {
      throw HeadquarterAlreadyExistsException();
    }
    }

    return repository.update(updatedHeadquarters);
  }
}
