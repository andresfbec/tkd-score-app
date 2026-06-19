import '../../repositories/versus_repository.dart';

class UpdateVersusState {
  final VersusRepository repository;

  UpdateVersusState(this.repository);

  Future<bool> call(int versusId, String state) async {
    return await repository.updateState(versusId, state);
  }
}
