class UserModel {
  final int id;
  final String username;
  final String password;
  final int headquartersId;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int synchronized;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.headquartersId,
    this.createdAt,
    this.updatedAt,
    this.synchronized = 0,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      username: map['username'] as String,
      password: map['password'] as String,
      headquartersId: map['headquarters_id'] as int,
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
      'username': username,
      'password': password,
      'headquarters_id': headquartersId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'synchronized': synchronized,
    };
  }
}
