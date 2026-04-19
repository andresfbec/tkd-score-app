import 'package:equatable/equatable.dart';

class TournamentEntity extends Equatable {
  final int? id;
  final String name;
  final String host;
  final String location;
  final DateTime dateStart;
  final DateTime dateEnd;
  final String status;
  final String discipline;
  final String setupPhase;

  const TournamentEntity({
    this.id,
    required this.name,
    required this.host,
    required this.location,
    required this.dateStart,
    required this.dateEnd,
    required this.status,
    required this.discipline,
    required this.setupPhase,
  });

  TournamentEntity copyWith({
    int? id,
    String? name,
    String? host,
    String? location,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? status,
    String? discipline,
    String? setupPhase,
  }) {
    return TournamentEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      host: host ?? this.host,
      location: location ?? this.location,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      status: status ?? this.status,
      discipline: discipline ?? this.discipline,
      setupPhase: setupPhase ?? this.setupPhase,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        host,
        location,
        dateStart,
        dateEnd,
        status,
        discipline,
        setupPhase,
      ];
}
