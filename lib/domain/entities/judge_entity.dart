import 'package:equatable/equatable.dart';

class JudgeEntity extends Equatable {
  final int? id;
  final String names;
  final String document;
  final String club;
  final String phone;
  final String rank;
  final int participations;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isActive;

  const JudgeEntity({
    this.id,
    required this.names,
    required this.document,
    this.club = '',
    this.phone = '',
    this.rank = '',
    this.participations = 0,
    this.createdAt,
    this.updatedAt,
    this.isActive = true,
  });

  JudgeEntity copyWith({
    int? id,
    String? names,
    String? document,
    String? club,
    String? phone,
    String? rank,
    int? participations,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
  }) {
    return JudgeEntity(
      id: id ?? this.id,
      names: names ?? this.names,
      document: document ?? this.document,
      club: club ?? this.club,
      phone: phone ?? this.phone,
      rank: rank ?? this.rank,
      participations: participations ?? this.participations,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [
        id,
        names,
        document,
        club,
        phone,
        rank,
        participations,
        createdAt,
        updatedAt,
        isActive,
      ];
}
