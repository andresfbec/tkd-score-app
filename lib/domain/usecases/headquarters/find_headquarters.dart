import '../../repositories/headquarters_repository.dart';
import '../../entities/headquarters_entity.dart';

class FindHeadquarters {
  final HeadquartersRepository repository;

  FindHeadquarters(this.repository);

  Future<List<HeadquartersEntity>> call({
    String? name,
    String? city,
    String? address,
  }) {
    return repository.find(
      name: name,
      city: city,
      address: address,
    );
  }
}