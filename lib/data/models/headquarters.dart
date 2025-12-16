import 'package:equatable/equatable.dart';

class Headquarters extends Equatable {
  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final String city;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const Headquarters({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.city,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory Headquarters.fromJson(Map<String, dynamic> json) {
    return Headquarters(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      city: json['city'] as String,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      synchronized: json['synchronized'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'city': city,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  Headquarters copyWith({
    int? id,
    String? name,
    String? address,
    String? phoneNumber,
    String? city,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return Headquarters(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    address,
    phoneNumber,
    city,
    createdAt,
    updatedAt,
    synchronized,
  ];
}
