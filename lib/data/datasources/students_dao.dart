import 'package:drift/drift.dart';
import '../../core/constants/fields.dart';
import '../../core/config/db/database.dart';
import '../../core/utils/student_model_info_coplete.dart';

class StudentsDao {
  final AppDatabase _db;

  StudentsDao(this._db);

  Future<int> insert(StudentsCompanion sd) async {
    return _db.into(_db.students).insert(sd);
  }

  Future<bool> update(StudentsCompanion sd) async {
    if (!sd.id.present) {
      throw ArgumentError('ID requerido para update');
    }

    final rowsAfected = await (_db.update(
      _db.students,
    )..where((tbl) => tbl.id.equals(sd.id.value))).write(sd);

    return rowsAfected > 0; // true si se actualizó al menos una fila
  }

  Future<int> delete(int pk) async {
    return await (_db.update(_db.students)..where((tbl) => tbl.id.equals(pk)))
        .write(const StudentsCompanion(isActive: Value(0)));
  }

  // Super metodo para obtener todos los estudiantes (activos) y recibir parametros de filtramiento opcionales (una fuente unica de verdad)
  // El filtramiento se hace a nivel de la consulta, no en la UI, para evitar inconsistencias y mejorar el rendimiento
  Stream<List<StudentWithInfo>> watchStudents({
    List<int>? hqIds,
    List<int>? beltIds,
    String? gender, // Filtro de género
    int? minAge, // Edad mínima (ej: 5)
    int? maxAge, // Edad máxima (ej: 12)
    double? minWeight,
    double? maxWeight,
    bool? onlyActive,
  }) {
    final query = _db.select(_db.students).join([
      leftOuterJoin(
        _db.headquarters,
        _db.headquarters.id.equalsExp(_db.students.headquarterId),
      ),
      leftOuterJoin(_db.belts, _db.belts.id.equalsExp(_db.students.beltId)),
    ]);

    // --- 1. LÓGICA DE EDAD (El "Truco" de Fechas) ---
    final hoy = DateTime.now();

    if (minAge != null) {
      // Si quiero alguien de MÍNIMO 10 años, su fecha de nacimiento
      // debe ser IGUAL o ANTERIOR a "Hoy hace 10 años".
      final fechaLimiteMin = DateTime(hoy.year - minAge, hoy.month, hoy.day);
      query.where(_db.students.birthDate.isSmallerOrEqualValue(fechaLimiteMin));
    }

    if (maxAge != null) {
      // Si quiero alguien de MÁXIMO 17 años, su fecha de nacimiento
      // debe ser POSTERIOR a "Hoy hace 18 años".
      final fechaLimiteMax = DateTime(
        hoy.year - maxAge - 1,
        hoy.month,
        hoy.day + 1,
      );
      query.where(_db.students.birthDate.isBiggerOrEqualValue(fechaLimiteMax));
    }

    // --- 2. FILTRO DE GÉNERO ---
    if (gender != null && gender.isNotEmpty) {
      query.where(_db.students.gender.equals(gender));
    }

    // --- 3. FILTROS MULTI-SELECCIÓN (IDs) ---
    if (hqIds != null && hqIds.isNotEmpty) {
      query.where(_db.students.headquarterId.isIn(hqIds));
    }

    if (beltIds != null && beltIds.isNotEmpty) {
      query.where(_db.students.beltId.isIn(beltIds));
    }

    // --- 4. FILTROS DE PESO Y TALLA ---
    if (minWeight != null) {
      query.where(_db.students.weightKg.isBiggerOrEqualValue(minWeight));
    }
    if (maxWeight != null) {
      query.where(_db.students.weightKg.isSmallerOrEqualValue(maxWeight));
    }

    // --- 5. ESTADO ACTIVO ---
    if (onlyActive != null) {
      query.where(_db.students.isActive.equals(onlyActive ? 1 : 0));
    } else {
      query.where(_db.students.isActive.equals(1)); // Por defecto activos
    }

    return query.watch().map((rows) {
      return rows.map((row) {
        return StudentWithInfo(
          student: row.readTable(_db.students),
          headquarter: row.readTableOrNull(_db.headquarters),
          belt: row.readTableOrNull(_db.belts),
        );
      }).toList();
    });
  }

  Future<StudentWithInfo?> getStudentByIdentify(String number) async {
    final query = _db.select(_db.students).join([
      leftOuterJoin(
        _db.headquarters,
        _db.headquarters.id.equalsExp(_db.students.headquarterId),
      ),
      leftOuterJoin(_db.belts, _db.belts.id.equalsExp(_db.students.beltId)),
    ])
    ..where(_db.students.numberIdentify.equals(number));

    final row = await query.getSingleOrNull();

    if (row == null) return null;

    return StudentWithInfo(
      student: row.readTable(_db.students),
      headquarter: row.readTableOrNull(_db.headquarters),
      belt: row.readTableOrNull(_db.belts),
    );
  }

  
  Future<StudentWithInfo?> getStudentById(int id) async {
    final query = _db.select(_db.students).join([
      leftOuterJoin(_db.headquarters, _db.headquarters.id.equalsExp(_db.students.headquarterId)),
      leftOuterJoin(_db.belts, _db.belts.id.equalsExp(_db.students.beltId)),
    ])..where(_db.students.id.equals(id));

    final row = await query.getSingleOrNull();
    
    if (row == null) return null;

    return StudentWithInfo(
      student: row.readTable(_db.students),
      headquarter: row.readTableOrNull(_db.headquarters),
      belt: row.readTableOrNull(_db.belts),
    );
  }
}
