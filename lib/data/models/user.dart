import 'package:equatable/equatable.dart';
import 'headquarters.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String password;
  final Headquarters headquarters;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  const User({
    required this.id,
    required this.username,
    required this.password,
    required this.headquarters,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      headquarters: Headquarters.fromJson(
        json['headquarters'] as Map<String, dynamic>,
      ),
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
      'username': username,
      'password': password,
      'headquarters': headquarters.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }

  User copyWith({
    int? id,
    String? username,
    String? password,
    Headquarters? headquarters,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      headquarters: headquarters ?? this.headquarters,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [
    id,
    username,
    password,
    headquarters,
    createdAt,
    updatedAt,
    synchronized,
  ];
}
