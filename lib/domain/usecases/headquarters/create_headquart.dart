import '../../entities/headquarters_entity.dart';
import '../../repositories/headquarters_repository.dart';

class CreateHeadquart {
  final HeadquartersRepository repository;

  CreateHeadquart(this.repository);

  Future<int> call(HeadquartersEntity headquarters) async {
    print(headquarters);
    if (headquarters.name.trim().isEmpty) {
      throw Exception('El nombre es obligatorio');
    }
    if (headquarters.phoneNumber.trim().isEmpty) {
      throw Exception('El teléfono es obligatorio');
    }

    if (headquarters.city.trim().isEmpty) {
      throw Exception('La ciudad es obligatoria');
    }
    print(headquarters.name);

    print(headquarters.city);

    final exists = await repository.find(
      name: headquarters.name,
      city: headquarters.city,
    );
    print("Lo que me devuelve la consulta: $exists");

    if (exists!.isNotEmpty) {
      throw Exception('La sede ya existe');
    }

    return repository.create(headquarters);
  }
}
