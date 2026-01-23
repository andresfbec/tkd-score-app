import '../../domain/entities/headquarters_entity.dart';

class HeadquartersMapper {
  static HeadquartersEntity fromMap(Map<String, dynamic> map) {
    return HeadquartersEntity(
      id: map['id'] as int,
      name: map['name'],
      address: map['address'],
      city: map['city'],
      phoneNumber: map['phone'],
    );
  }
}
