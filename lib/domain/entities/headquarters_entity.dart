import 'package:equatable/equatable.dart';

class HeadquartersEntity extends Equatable {
  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final String city;

  const HeadquartersEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.city,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        phoneNumber,
        city,
      ];
}
