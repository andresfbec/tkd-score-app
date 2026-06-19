import '../db/database.dart';
import '../db/app_database_provider.dart';

// DAOs y Repos Impl
import '../../../data/datasources/students_dao.dart';
import '../../../data/repositories_impl/students_repository_impl.dart';

// Repositorios de apoyo para validaciones (Inyectados desde sus propios Injection)
import 'dependency_headquarters.dart';
import 'dependency_belts.dart'; // Asumiendo que tienes uno similar para cinturones

// Use Cases
import '../../../domain/usecases/students/create_student.dart';
import '../../../domain/usecases/students/update_student.dart';
import '../../../domain/usecases/students/delete_student.dart';
import '../../../domain/usecases/students/watch_students.dart';


class InjectionStudents {
  static final InjectionStudents _instance = InjectionStudents._internal();
  factory InjectionStudents() => _instance;
  InjectionStudents._internal();

  // Esta variable guarda el repositorio una vez creado
  StudentsRepositoryImpl? _repository;

  // Este "getter" se encarga de crear el repositorio si no existe
  StudentsRepositoryImpl get studentsRepository {
    return _repository ??= StudentsRepositoryImpl(
      studentsDao: StudentsDao(AppDatabaseProvider.instance),
    );
  }

  // Estos son los que usa tu Controller. 
  // Si los llamas, ellos mismos crean lo que necesitan.
  CreateStudent get createStudent => CreateStudent(
        studentsRepository,
        InjectionHeadquarters().headquartersRepository,
        InjectionBelts().beltsRepository,
      );

  UpdateStudent get updateStudent => UpdateStudent(
        studentsRepository,
        InjectionHeadquarters().headquartersRepository,
        InjectionBelts().beltsRepository,
      );

  DeleteStudent get deleteStudent => DeleteStudent(studentsRepository);
  
  WatchStudents get watchStudents => WatchStudents(studentsRepository);
}