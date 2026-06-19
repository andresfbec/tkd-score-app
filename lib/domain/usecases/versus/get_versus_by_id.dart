import '../../entities/versus_entity.dart';
import '../../repositories/versus_repository.dart';

class GetVersusById {
  final VersusRepository repository;

  GetVersusById(this.repository);

  Future<VersusEntity?> call(int id) async {
    return await repository.getById(id);
  }
}
