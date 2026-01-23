import 'package:equatable/equatable.dart';
import 'headquarters_entity.dart';

class UserEntity extends Equatable {
  final int id;
  final String username;
  final HeadquartersEntity headquarters;

  const UserEntity({
    required this.id,
    required this.username,
    required this.headquarters,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        headquarters,
      ];
}
