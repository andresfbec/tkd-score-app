import '../../domain/entities/belts_entity.dart';

class BeltsMapper {
  static BeltsEntity fromMap(Map<String, dynamic> map) {
    return BeltsEntity(id: map['id'] as int, name: map['name'] as String);
  }
}
