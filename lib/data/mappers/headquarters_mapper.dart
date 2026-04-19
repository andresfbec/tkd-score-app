import '../../domain/entities/headquarters_entity.dart';
import '../../core/config/db/database.dart';
import 'package:drift/drift.dart';

class HeadquartersMapper {

  static HeadquartersEntity fromData(Headquarter data) { // Lectura Heaquarter -> Entity
    return HeadquartersEntity(
      id: data.id,
      name: data.name,
      address: data.address,
      city: data.city,
      phoneNumber: data.phone,
      master: data.master,
    );
  }

  static HeadquartersCompanion toCompanion(HeadquartersEntity entity) { // Escritura Entity -> Companion
  return HeadquartersCompanion(
    id: entity.id != null ? Value(entity.id!) : const Value.absent(), // ID es opcional (no se envia en insert pero si en update)
    name: Value(entity.name),
    address: Value(entity.address),
    city: Value(entity.city),
    phone: Value(entity.phoneNumber),
    master: Value(entity.master), 
  );
}
}
