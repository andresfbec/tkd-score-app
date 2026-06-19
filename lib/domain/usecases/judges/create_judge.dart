import '../../entities/judge_entity.dart';
import '../../repositories/judges_repository.dart';

class CreateJudge {
  final JudgesRepository repository;

  CreateJudge(this.repository);

  Future<int> call(JudgeEntity judge) async {
    if (judge.names.trim().isEmpty) {
      throw Exception('El nombre no puede estar vacío');
    }
    if (judge.document.trim().isEmpty) {
      throw Exception('El documento no puede estar vacío');
    }
    
    return await repository.create(judge);
  }
}
