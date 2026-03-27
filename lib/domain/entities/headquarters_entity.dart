import 'package:equatable/equatable.dart';

class HeadquartersEntity extends Equatable {
  final int? id;
  final String name;
  final String address;
  final String phoneNumber;
  final String city;

  const HeadquartersEntity({
    this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.city,
  });

  HeadquartersEntity copyWith({ // permite hacer algo asi : final updated = entity.copyWith(name: "Nueva sede");
    int? id,                    // solo actualiza los campos que se proporcionan, el resto mantiene su valor original
    String? name,
    String? address,
    String? phoneNumber,
    String? city,
  }) {
    return HeadquartersEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
    );
  }

  @override
  List<Object?> get props => [id, name, address, phoneNumber, city]; // compara por valor, no por referencia 
}