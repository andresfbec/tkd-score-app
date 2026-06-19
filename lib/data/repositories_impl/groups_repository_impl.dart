import 'package:drift/drift.dart';
import '../../core/config/db/database.dart';
import '../../domain/entities/groups_entity.dart';
import '../../domain/repositories/groups_repository.dart';
import '../datasources/groups_dao.dart';
import '../datasources/inscriptions_dao.dart';
import '../../core/constants/tkd_official_categories.dart';
import '../../core/utils/format_date.dart';

class GroupsRepositoryImpl implements GroupsRepository {
  final GroupsDao _groupsDao;
  final InscriptionsDao _inscriptionsDao;

  GroupsRepositoryImpl(this._groupsDao, this._inscriptionsDao);

  @override
  Future<void> generateStandardGroups({
    required int tournamentId,
    required List<String> selectedAges,
    required List<String> selectedBelts,
    int? weightStepKg,
    bool? mergeGenders,
    bool? mergeAges,
  }) async {
    final generatedConfigs = (weightStepKg != null || mergeGenders != null || mergeAges != null)
        ? TkdOfficialCategories.generateCompactGroupsConfigs(
            selectedAges: selectedAges,
            selectedBelts: selectedBelts,
            tournamentId: tournamentId,
            weightStepKg: weightStepKg ?? 15,
            mergeGenders: mergeGenders ?? true,
            mergeAges: mergeAges ?? false,
          )
        : TkdOfficialCategories.generateGroupsConfigs(
            selectedAges: selectedAges,
            selectedBelts: selectedBelts,
            tournamentId: tournamentId,
          );

    final companions = generatedConfigs.map((config) {
      return GroupsCompanion.insert(
        tournamentId: config['tournamentId'],
        name: config['name'],
        gender: Value(config['gender']),
        ageMin: Value(config['ageMin']),
        ageMax: Value(config['ageMax']),
        weightMin: Value(config['weightMin']),
        weightMax: Value(config['weightMax']),
        beltFromId: Value(config['beltFromId']),
        beltToId: Value(config['beltToId']),
        state: Value(config['state']),
        description: Value(config['description']),
      );
    }).toList();

    await _groupsDao.insertBatch(companions);
  }

  @override
  Stream<List<GroupsEntity>> watchGroupsByTournament(int tournamentId) {
    return _groupsDao.watchGroups(tournamentId);
  }

  @override
  Future<void> deleteGeneratedGroups(int tournamentId) async {
    await _groupsDao.deleteAllByTournament(tournamentId);
  }

  @override
  Future<void> autoAssignInscriptions(int tournamentId) async {
    final groups = await _groupsDao.getGroupsByTournament(tournamentId);
    if (groups.isEmpty) return;

    final inscriptions = await _inscriptionsDao.getInscriptionsByTournament(tournamentId);

    for (var ins in inscriptions) {
      final age = ins.studentBirthDate != null ? DateHelper.calculateAge(ins.studentBirthDate!) : 0;
      final weight = ins.studentWeight ?? 0.0;
      final gender = "mixed"; // TODO: Necesitamos el género real si no es mixto
      final beltId = 1; // TODO: Necesitamos el beltId real

      final matchingGroup = _findMatchingGroup(
        groups: groups,
        age: age,
        weight: weight,
        gender: gender,
        beltId: beltId,
      );

      if (matchingGroup != null) {
        await _inscriptionsDao.update(
          InscriptionCompanion(
            id: Value(ins.id!),
            groupId: Value(matchingGroup.id),
          ),
        );
      }
    }
  }

  @override
  Future<void> updateInscriptionGroup(int inscriptionId, int? groupId) async {
    await _inscriptionsDao.update(
      InscriptionCompanion(
        id: Value(inscriptionId),
        groupId: Value(groupId),
      ),
    );
  }

  GroupsEntity? _findMatchingGroup({
    required List<GroupsEntity> groups,
    required int age,
    required double weight,
    required String gender,
    required int beltId,
  }) {
    try {
      return groups.firstWhere((g) {
        bool matchGender = g.gender.toLowerCase() == "mixed" || g.gender.toLowerCase() == gender.toLowerCase();
        
        bool matchAge = true;
        if (g.ageMin != null) matchAge = matchAge && age >= g.ageMin!;
        if (g.ageMax != null) matchAge = matchAge && age <= g.ageMax!;

        bool matchWeight = true;
        if (g.weightMin != null) matchWeight = matchWeight && weight >= g.weightMin!;
        if (g.weightMax != null) matchWeight = matchWeight && weight <= g.weightMax!;

        return matchGender && matchAge && matchWeight;
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> mergeGroupWithNeighbour(int groupId) async {
    final groupToMerge = await _groupsDao.getGroupById(groupId);
    if (groupToMerge == null) return;

    final allGroups = await _groupsDao.getGroupsByTournament(groupToMerge.tournamentId);
    
    // Lógica simplificada de fusión
    GroupsEntity? neighbour;
    try {
      neighbour = allGroups.firstWhere((g) => g.id != groupToMerge.id && g.gender == groupToMerge.gender);
    } catch (e) {
      return;
    }

    await _inscriptionsDao.updateInscriptionsGroup(groupToMerge.id!, neighbour.id!);
    await _groupsDao.delete(groupToMerge.id!);
  }

  @override
  Future<int> createGroup(GroupsEntity group) async {
    return await _groupsDao.insert(GroupsCompanion.insert(
      tournamentId: group.tournamentId,
      name: group.name,
      gender: Value(group.gender),
      ageMin: Value(group.ageMin),
      ageMax: Value(group.ageMax),
      weightMin: Value(group.weightMin),
      weightMax: Value(group.weightMax),
      beltFromId: Value(group.beltFromId),
      beltToId: Value(group.beltToId),
      state: Value(group.state),
      description: Value(group.description),
    ));
  }

  @override
  Future<void> deleteGroup(int groupId) async {
    await _groupsDao.delete(groupId);
  }
}
