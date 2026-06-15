import '../../repositories/point_types_repository.dart';
import '../../entities/point_types_entity.dart';

class GetAllPointTypes {
  final PointTypesRepository repository;

  GetAllPointTypes(this.repository);

  Future<List<PointTypesEntity>> call() async {
    return await repository.getAll();
  }
}
