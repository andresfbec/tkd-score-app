import '../../repositories/belts_repository.dart';
import '../../entities/belts_entity.dart';

class GetAllBelts {
  final BeltsRepository repository;

  GetAllBelts(this.repository);

  Future<List<BeltsEntity>> call() async {
    return await repository.getAll();
  }
}
