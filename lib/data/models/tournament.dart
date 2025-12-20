import 'package:equatable/equatable.dart';

class Tournament extends Equatable {
  final int id;
  final String name;
  final String location;
  final DateTime? datestart;
  final DateTime? dateend;
  final String status;
  final int synchronized;
  const Tournament({
    required this.id,
    required this.name,
    required this.location,
    this.datestart,
    this.dateend,
    required this.status,
    this.synchronized = 0,
  });
  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      id: json['id'] as int,
      name: json['name'] as String,
      location: json['location'] as String,
      datestart: json['datestart'] != null
          ? DateTime.parse(json['datestart'] as String)
          : null,
      dateend: json['dateend'] != null
          ? DateTime.parse(json['dateend'] as String)
          : null,
      status: json['status'] as String,
      synchronized: json['synchronized'] as int? ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'datestart': datestart?.toIso8601String(),
      'dateend': dateend?.toIso8601String(),
      'status': status,
      'synchronized': synchronized,
    };
  }

  Tournament copyWith({
    int? id,
    String? name,
    String? location,
    DateTime? datestart,
    DateTime? dateend,
    String? status,
    int? synchronized,
  }) {
    return Tournament(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      datestart: datestart ?? this.datestart,
      dateend: dateend ?? this.dateend,
      status: status ?? this.status,
      synchronized: synchronized ?? this.synchronized,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    location,
    datestart,
    dateend,
    status,
    synchronized,
  ];
}
