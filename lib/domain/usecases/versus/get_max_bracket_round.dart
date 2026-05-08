import '../../repositories/versus_repository.dart';

class GetMaxBracketRound {
  final VersusRepository repository;

  GetMaxBracketRound(this.repository);

  Future<int> call(int groupId) async {
    return await repository.getMaxBracketRound(groupId);
  }
}
