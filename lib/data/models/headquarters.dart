class HeadquartersModel {
  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final String city;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  HeadquartersModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.city,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory HeadquartersModel.fromMap(Map<String, dynamic> map) {
    return HeadquartersModel(
      id: map['id'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      phoneNumber: map['phone_number'] as String,
      city: map['city'] as String,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'])
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'])
          : null,
      synchronized: map['synchronized'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone_number': phoneNumber,
      'city': city,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }
}
