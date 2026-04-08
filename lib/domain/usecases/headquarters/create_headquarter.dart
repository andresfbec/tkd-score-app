import '../../entities/headquarters_entity.dart';
import '../../repositories/headquarters_repository.dart';
import '../../errors/exceptions.dart';

class CreateHeadquarter {
  final HeadquartersRepository repository;

  CreateHeadquarter(this.repository);

  Future<int> call(HeadquartersEntity headquarters) async {

    if (headquarters.name.trim().isEmpty) {
      throw EmptyNameException();
    }
    if (headquarters.phoneNumber.trim().isEmpty) {
      throw EmptyPhoneException();
    }

    if (headquarters.city.trim().isEmpty) {
      throw EmptyCityException();
    }

    if (headquarters.address.trim().isEmpty) {
      throw EmptyAddressException();
    }

    if (headquarters.master.trim().isEmpty) {
      throw EmptyMasterException();
    }

    final exists = await repository.find(
      name: headquarters.name,
      city: headquarters.city,
    );

    if (exists.isNotEmpty) {
      throw HeadquarterAlreadyExistsException();
    }

    return repository.create(headquarters);
  }
}
