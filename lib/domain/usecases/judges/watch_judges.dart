import '../../entities/judge_entity.dart';
import '../../repositories/judges_repository.dart';

class WatchJudges {
  final JudgesRepository repository;

  WatchJudges(this.repository);

  Stream<List<JudgeEntity>> call({bool onlyActive = true}) {
    return repository.watchJudges(onlyActive: onlyActive);
  }
}
