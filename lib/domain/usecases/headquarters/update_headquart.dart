import 'package:drift/drift.dart';
import 'package:tkd_score/domain/entities/headquarters_entity.dart';
import '../../repositories/headquarters_repository.dart';

class UpdateHeadquart {
  final HeadquartersRepository repository;

  UpdateHeadquart(this.repository);

  Future<bool> call(
    int pk, {
    String? name,
    String? address,
    String? city,
    String? phone,
  }) async {
    final existing = await repository.getById(pk);

    if (existing == null) {
      throw Exception('Sede a actualizar no existe');
    }
    final updatedHeadquarters = HeadquartersEntity(
      id: pk,
      name: name ?? existing.name,
      address: address ?? existing.address,
      city: city ?? existing.city,
      phoneNumber: phone ?? existing.phoneNumber,
    );

    return await repository.update(updatedHeadquarters);
  }
}
