import '../../domain/entities/headquarters_entity.dart';
import '../../core/config/db/database.dart';

class HeadquartersMapper {
  static HeadquartersEntity fromMap(Headquarter data) {
    return HeadquartersEntity(
      id: data.id,
      name: data.name,
      address: data.address,
      city: data.city,
      phoneNumber: data.phone,
    );
  }
}
