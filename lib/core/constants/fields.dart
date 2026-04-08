class HeadquarterFilter {
  final int? id;
  final String? name;
  final String? city;
  final String? address;

  const HeadquarterFilter({this.id, this.name, this.city, this.address});
}

class DatabaseFields {
  DatabaseFields._(); // Constructor privado para evitar instancias

  static const Set<String> headquarters = {
    'id',
    'name',
    'address',
    'city',
    'phone',
    'master', 
  };

  static const Set<String> users = {'id', 'username', 'headquartersId'};

  static const Set<String> students = {
    'id',
    'names',
    'surnames',
    'typeIdentify',
    'numberIdentify',
    'gender',
    'birthDate',
    'tournamentWins',
    'weightKg',
    'heightCm',
    'headquarterId',
    'beltId',
  };
}

const Set<String> fieldsTournaments = {
  'id',
  'name',
  'location',
  'date_start',
  'date_end',
  'status',
};

const Set<String> fieldsJudge = {'id', 'names', 'surnames', 'numberId'};

//  '''
//   CREATE TABLE IF NOT EXISTS judge (
//     id INTEGER PRIMARY KEY AUTOINCREMENT,
//     names TEXT,
//     surnames TEXT,
//     numberId TEXT,
//     createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
//     updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
//     synchronized INTEGER DEFAULT 0,
//     is_active INTEGER DEFAULT 1
//   )
//   ''',
