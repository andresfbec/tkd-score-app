
// domain/entities/belt_entity.dart
class BeltsEntity {
  final int id;
  final String name;
  final String primaryColor;
  final String? secondaryColor;

  const BeltsEntity({
    required this.id, 
    required this.name, 
    required this.primaryColor, 
    this.secondaryColor
  });
}
