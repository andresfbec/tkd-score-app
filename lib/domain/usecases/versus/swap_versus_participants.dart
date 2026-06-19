import '../../repositories/versus_repository.dart';

class SwapVersusParticipants {
  final VersusRepository repository;

  SwapVersusParticipants(this.repository);

  Future<void> call({
    required int versusIdA,
    required String slotA,
    required int versusIdB,
    required String slotB,
  }) async {
    return await repository.swapParticipants(
      versusIdA: versusIdA,
      slotA: slotA,
      versusIdB: versusIdB,
      slotB: slotB,
    );
  }
}
