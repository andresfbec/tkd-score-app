import 'package:equatable/equatable.dart';

class BeltsEntity extends Equatable {
  final int id;
  final String name;

  const BeltsEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
