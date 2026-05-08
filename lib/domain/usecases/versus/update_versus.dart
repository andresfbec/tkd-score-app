import '../../entities/versus_entity.dart';
import '../../repositories/versus_repository.dart';

class UpdateVersus {
  final VersusRepository repository;

  UpdateVersus(this.repository);

  Future<bool> call(VersusEntity versus) async {
    return await repository.update(versus);
  }
}
