import '../../repositories/judges_repository.dart';

class DeleteJudge {
  final JudgesRepository repository;

  DeleteJudge(this.repository);

  Future<int> call(int id) async {
    return await repository.delete(id);
  }
}
