import '../../repositories/versus_repository.dart';

class DeleteVersus {
  final VersusRepository repository;

  DeleteVersus(this.repository);

  Future<int> call(int id) async {
    return await repository.delete(id);
  }
}
