import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String username;
  final int headquarters;

  const UserEntity({
    required this.id,
    required this.username,
    required this.headquarters,
  });

  @override
  List<Object?> get props => [id, username, headquarters];
}
