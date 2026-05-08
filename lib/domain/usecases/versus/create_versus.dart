import '../../entities/versus_entity.dart';
import '../../repositories/versus_repository.dart';

class CreateVersus {
  final VersusRepository repository;

  CreateVersus(this.repository);

  Future<int> call(VersusEntity versus) async {
    return await repository.create(versus);
  }
}
