
class MockHeadquartersData {
  static final List<Map<String, dynamic>> headquarters = List.generate(4, (index) {
    return {
      'name': 'Buchido Paloblanco ${index + 1}',
      'address': 'Calle ${10 + index} #${index + 1}-00',
      'city': index % 2 == 0 ? 'Bogotá' : 'Medellín',
      'phoneNumber': '300${1000000 + index}',
      'status': index % 3 == 0 ? 'Activo' : 'Inactivo',
    };
  });
}