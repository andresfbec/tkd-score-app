import 'package:equatable/equatable.dart';

class GroupsEntity extends Equatable {
  final int? id;
  final int tournamentId;
  final String name;
  final String gender;
  final int? ageMin;
  final int? ageMax;
  final double? weightMin;
  final double? weightMax;
  final int? beltFromId;
  final int? beltToId;
  final String state;
  final String description;
  final int isActive;
  final int? participantsCount;

  const GroupsEntity({
    this.id,
    required this.tournamentId,
    required this.name,
    this.gender = 'mixed',
    this.ageMin,
    this.ageMax,
    this.weightMin,
    this.weightMax,
    this.beltFromId,
    this.beltToId,
    this.state = 'draft',
    this.description = '',
    this.isActive = 1,
    this.participantsCount = 0,
  });

  GroupsEntity copyWith({
    int? id,
    int? tournamentId,
    String? name,
    String? gender,
    int? ageMin,
    int? ageMax,
    double? weightMin,
    double? weightMax,
    int? beltFromId,
    int? beltToId,
    String? state,
    String? description,
    int? isActive,
    int? participantsCount,
  }) {
    return GroupsEntity(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      ageMin: ageMin ?? this.ageMin,
      ageMax: ageMax ?? this.ageMax,
      weightMin: weightMin ?? this.weightMin,
      weightMax: weightMax ?? this.weightMax,
      beltFromId: beltFromId ?? this.beltFromId,
      beltToId: beltToId ?? this.beltToId,
      state: state ?? this.state,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      participantsCount: participantsCount ?? this.participantsCount,
    );
  }

  @override
  List<Object?> get props => [
        id,
        tournamentId,
        name,
        gender,
        ageMin,
        ageMax,
        weightMin,
        weightMax,
        beltFromId,
        beltToId,
        state,
        description,
        isActive,
        participantsCount,
      ];
}
