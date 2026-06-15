// domain/entities/point_types_entity.dart
class PointTypesEntity {
  final int id;
  final String name;
  final int pointsValue;
  final String bodyZone;
  final String techniqueType;
  final bool isPenalty;

  const PointTypesEntity({
    required this.id,
    required this.name,
    required this.pointsValue,
    required this.bodyZone,
    required this.techniqueType,
    required this.isPenalty,
  });
}
