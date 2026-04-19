import 'dart:math';

// --- LAYER: DOMAIN (ENTITIES) ---
// Esta es la clase que rige tu capa de Presentation (UI)
class Referee {
  final String id;
  final String firstName;
  final String lastName;
  final String nationalId;
  final String affiliatedClub;
  final String phoneNumber;
  final String rank;
  final int participations;

  Referee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.nationalId,
    required this.affiliatedClub,
    required this.phoneNumber,
    required this.rank,
    required this.participations,
  });
}

// --- LAYER: DATA (MODELS & MOCKER) ---
// El Model extiende a la Entity para cumplir con la arquitectura
class RefereeModel extends Referee {
  RefereeModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.nationalId,
    required super.affiliatedClub,
    required super.phoneNumber,
    required super.rank,
    required super.participations,
  });
}

class JudgesMock {
  /// Devuelve una lista de entidades (Referee) para que la UI la consuma
  static List<Referee> getMockReferees() {
    return [
      RefereeModel(
        id: '1',
        firstName: 'Carlos',
        lastName: 'Rodríguez',
        nationalId: '1010203040',
        affiliatedClub: 'Dragones TKD',
        phoneNumber: '3101234567',
        rank: '4th Dan',
        participations: 15,
      ),
      RefereeModel(
        id: '2',
        firstName: 'Ana María',
        lastName: 'López',
        nationalId: '52433221',
        affiliatedClub: 'Liga de Cundinamarca',
        phoneNumber: '3009876543',
        rank: '3rd Dan',
        participations: 8,
      ),
      RefereeModel(
        id: '3',
        firstName: 'Jin',
        lastName: 'Woo',
        nationalId: '99080706',
        affiliatedClub: 'Kukkiwon Academy',
        phoneNumber: '3205554433',
        rank: '6th Dan',
        participations: 30,
      ),
      RefereeModel(
        id: '4',
        firstName: 'Diana',
        lastName: 'Pérez',
        nationalId: '1032445566',
        affiliatedClub: 'Eagle Warriors',
        phoneNumber: '3157778899',
        rank: '2nd Dan',
        participations: 3,
      ),
      RefereeModel(
        id: '5',
        firstName: 'Ricardo',
        lastName: 'Gómez',
        nationalId: '79112233',
        affiliatedClub: 'Hwarang Bogotá',
        phoneNumber: '3114445566',
        rank: '5th Dan',
        participations: 21,
      ),
    ];
  }

  /// Método útil si quieres generar un juez aleatorio para pruebas de inserción
  static Referee generateRandomReferee() {
    final random = Random();
    final id = random.nextInt(1000).toString();
    return RefereeModel(
      id: id,
      firstName: 'Judge $id',
      lastName: 'Surname',
      nationalId: 'ID-$id',
      affiliatedClub: 'Random Club',
      phoneNumber: '300000000',
      rank: '1st Dan',
      participations: 0,
    );
  }
}