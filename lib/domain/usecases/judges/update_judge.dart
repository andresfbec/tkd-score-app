import '../../entities/judge_entity.dart';
import '../../repositories/judges_repository.dart';

class UpdateJudge {
  final JudgesRepository repository;

  UpdateJudge(this.repository);

  Future<bool> call(JudgeEntity judge) async {
    if (judge.id == null) {
      throw Exception('ID requerido para actualización');
    }
    if (judge.names.trim().isEmpty) {
      throw Exception('El nombre no puede estar vacío');
    }
    return await repository.update(judge);
  }
}
