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
  };

  static const Set<String> users = {'id', 'username', 'headquartersId'};

  static const Set<String> students = {
    'id',
    'names',
    'surnames',
    'typeDocument',
    'documentNumber',
    'age',
    'gender',
    'weight',
    'size',
    'headquarterId',
    'beltsId',
  };
}
