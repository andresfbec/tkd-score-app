import '../db/database.dart';
import '../../../data/datasources/headquarters_dao.dart';
import '../../../data/repositories_impl/headquarters_repository_impl.dart';

import '../db/app_database_provider.dart'; // instancia unica de la db 

import '../../../domain/usecases/headquarters/create_headquarter.dart';
import '../../../domain/usecases/headquarters/delete_headquarter.dart';
import '../../../domain/usecases/headquarters/get_all_headquarters.dart';
import '../../../domain/usecases/headquarters/update_headquarter.dart';
import '../../../domain/usecases/headquarters/find_headquarters.dart';
import '../../../domain/usecases/headquarters/watch_headquarters.dart';
import '../../../domain/usecases/headquarters/get_headquarter_by_id.dart';

class InjectionHeadquarters {
  static final InjectionHeadquarters _instance = InjectionHeadquarters._internal();
  factory InjectionHeadquarters() => _instance;
  InjectionHeadquarters._internal();

  // 1. Repositorio privado que puede ser nulo al inicio
  HeadquartersRepositoryImpl? _repository;

  // 2. Getter inteligente para el Repositorio (Singleton)
  HeadquartersRepositoryImpl get headquartersRepository {
    return _repository ??= HeadquartersRepositoryImpl(
      HeadquartersDao(AppDatabaseProvider.instance),
    );
  }

  // 3. Getters de los Use Cases (se instancian solos al llamarlos)
  CreateHeadquarter get createHeadquarter => CreateHeadquarter(headquartersRepository);
  UpdateHeadquarter get updateHeadquarter => UpdateHeadquarter(headquartersRepository);
  DeleteHeadquarter get deleteHeadquarter => DeleteHeadquarter(headquartersRepository);
  GetAllHeadquarters get getAllHeadquarters => GetAllHeadquarters(headquartersRepository);
  GetHeadquarterById get getHeadquarterById => GetHeadquarterById(headquartersRepository);
  FindHeadquarters get findHeadquarters => FindHeadquarters(headquartersRepository);
  WatchHeadquarters get watchHeadquarters => WatchHeadquarters(headquartersRepository);
  
  // 💡 El método static init() YA NO ES NECESARIO. Puedes borrarlo.
}
