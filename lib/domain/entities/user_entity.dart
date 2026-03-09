import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String username;
  final String? password;
  final int headquarterId;

  const UserEntity({
    required this.id,
    required this.username,
    required this.headquarterId,
    required this.password,
  });

  @override
  List<Object?> get props => [id, username, password, headquarterId];
}
