import '../../entities/versus_entity.dart';
import '../../repositories/versus_repository.dart';

class CreateBatchVersus {
  final VersusRepository repository;

  CreateBatchVersus(this.repository);

  Future<void> call(List<VersusEntity> versusList) async {
    return await repository.createBatch(versusList);
  }
}
