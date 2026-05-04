import '../db/app_database_provider.dart';

import '../../../data/datasources/groups_dao.dart';
import '../../../data/datasources/inscriptions_dao.dart';
import '../../../data/repositories_impl/groups_repository_impl.dart';

import '../../../domain/usecases/groups/generate_standard_groups.dart';
import '../../../domain/usecases/groups/auto_assign_inscriptions.dart';
import '../../../domain/usecases/groups/watch_tournament_groups.dart';
import '../../../domain/usecases/groups/delete_generated_groups.dart';
import '../../../domain/usecases/groups/update_inscription_group.dart';
import '../../../domain/usecases/groups/create_group.dart';
import '../../../domain/usecases/groups/delete_group.dart';

class InjectionGroups {
  static final InjectionGroups _instance = InjectionGroups._internal();
  factory InjectionGroups() => _instance;
  InjectionGroups._internal();

  GroupsRepositoryImpl? _repository;

  GroupsRepositoryImpl get groupsRepository {
    if (_repository == null) {
      final db = AppDatabaseProvider.instance;
      _repository = GroupsRepositoryImpl(GroupsDao(db), InscriptionsDao(db));
    }
    return _repository!;
  }

  // Use Cases
  GenerateStandardGroups get generateStandardGroups => GenerateStandardGroups(groupsRepository);
  AutoAssignInscriptions get autoAssignInscriptions => AutoAssignInscriptions(groupsRepository);
  WatchTournamentGroups get watchTournamentGroups => WatchTournamentGroups(groupsRepository);
  DeleteGeneratedGroups get deleteGeneratedGroups => DeleteGeneratedGroups(groupsRepository);
  UpdateInscriptionGroup get updateInscriptionGroup => UpdateInscriptionGroup(groupsRepository);
  CreateGroup get createGroup => CreateGroup(groupsRepository);
  DeleteGroup get deleteGroup => DeleteGroup(groupsRepository);
}
