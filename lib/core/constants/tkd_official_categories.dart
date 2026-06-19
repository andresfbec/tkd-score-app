class TkdOfficialCategories {
  // === CATEGORÍAS DE EDAD ===
  static const String preCadets = 'Pre-Cadetes'; // Menores de 11
  static const String cadets = 'Cadetes'; // 12 a 14 años
  static const String juniors = 'Juveniles'; // 15 a 17 años
  static const String seniors = 'Mayores'; // 18+ años

  // === RANGOS DE EDAD ===
  static const Map<String, Map<String, int>> ageRanges = {
    preCadets: {'min': 4, 'max': 11},
    cadets: {'min': 12, 'max': 14},
    juniors: {'min': 15, 'max': 17},
    seniors: {'min': 18, 'max': 99},
  };

  // === CATEGORÍAS DE CINTURONES (Basado en la DB de 11 cinturones) ===
  static const String beltsBeginner = 'Principiantes';
  static const String beltsIntermediate = 'Intermedios';
  static const String beltsAdvanced = 'Avanzados / Negros';

  static const Map<String, Map<String, int>> beltRanges = {
    beltsBeginner: {'minId': 1, 'maxId': 4}, // Blanco a Amarillo Franja Verde
    beltsIntermediate: {'minId': 5, 'maxId': 8}, // Verde a Azul Franja Roja
    beltsAdvanced: {'minId': 9, 'maxId': 11}, // Rojo a Negro
  };

  // === PESOS OFICIALES WT ===
  // Formato: Lista de pesos máximos. El peso mínimo de una categoría es el máximo de la anterior (+0.1)
  // El último número indica la categoría "Más de X kg"
  static const Map<String, Map<String, List<double>>> officialWeights = {
    preCadets: {
      'Masculino': [20, 24, 27, 30, 33, 36, 40, 44, 48, 52, 999], // 999 = Más de 52
      'Femenino': [20, 24, 27, 30, 33, 36, 40, 44, 48, 52, 999],
    },
    cadets: {
      'Masculino': [33, 37, 41, 45, 49, 53, 57, 61, 65, 999],
      'Femenino': [29, 33, 37, 41, 44, 47, 51, 55, 59, 999],
    },
    juniors: {
      'Masculino': [45, 48, 51, 55, 59, 63, 68, 73, 78, 999],
      'Femenino': [42, 44, 46, 49, 52, 55, 59, 63, 68, 999],
    },
    seniors: {
      'Masculino': [54, 58, 63, 68, 74, 80, 87, 999],
      'Femenino': [46, 49, 53, 57, 62, 67, 73, 999],
    },
  };

  /// Genera una lista de definiciones de grupos matemáticamente perfectos para la UI y la DB.
  /// Retorna una lista de mapas con los datos listos para ser insertados en la tabla `groups`.
  static List<Map<String, dynamic>> generateGroupsConfigs({
    required List<String> selectedAges, // Ej: [cadets, juniors]
    required List<String> selectedBelts, // Ej: [beltsBeginner]
    required int tournamentId,
  }) {
    List<Map<String, dynamic>> generatedGroups = [];

    for (var ageCat in selectedAges) {
      final ageMin = ageRanges[ageCat]!['min'];
      final ageMax = ageRanges[ageCat]!['max'];
      final weightsObj = officialWeights[ageCat]!;

      for (var beltCat in selectedBelts) {
        final beltMinId = beltRanges[beltCat]!['minId'];
        final beltMaxId = beltRanges[beltCat]!['maxId'];

        for (var gender in ['Masculino', 'Femenino']) {
          final weightsList = weightsObj[gender]!;
          double currentMin = 0.0;

          for (var maxWeight in weightsList) {
            String weightStr = '';
            if (maxWeight == 999) {
              weightStr = '+${currentMin.toInt()}kg';
            } else {
              weightStr = '-${maxWeight.toInt()}kg';
            }

            final groupName = '$ageCat $gender $beltCat $weightStr';

            generatedGroups.add({
              'tournamentId': tournamentId,
              'name': groupName,
              'gender': gender,
              'ageMin': ageMin,
              'ageMax': ageMax,
              'weightMin': currentMin,
              'weightMax': maxWeight == 999 ? 999.0 : maxWeight,
              'beltFromId': beltMinId,
              'beltToId': beltMaxId,
              'state': 'draft',
              'description': 'Generado automáticamente',
            });

            currentMin = maxWeight + 0.1; // El siguiente grupo empieza 100g después
          }
        }
      }
    }

    return generatedGroups;
  }

  /// Genera grupos compactos según la granularidad indicada.
  /// 
  /// - [weightStepKg] define el ancho de cada rango de peso (ej. 15 kg).
  /// - [mergeGenders] si es true crea un único grupo "Mixto" por rango.
  /// - [mergeAges] si es true trata todas las edades seleccionadas como una sola.
  static List<Map<String, dynamic>> generateCompactGroupsConfigs({
    required List<String> selectedAges,
    required List<String> selectedBelts,
    required int tournamentId,
    int weightStepKg = 15,
    bool mergeGenders = true,
    bool mergeAges = false,
  }) {
    // 1. Unir edades si corresponde
    final List<String> ages = mergeAges ? ['merged'] : selectedAges;

    // 2. Calcular peso máximo global de las edades/géneros seleccionados
    double globalMax = 0;
    for (final age in selectedAges) {
      for (final gender in ['Masculino', 'Femenino']) {
        final list = officialWeights[age]![gender]!;
        final maxVal = list.where((w) => w < 999).fold(0.0, (double p, double e) => e > p ? e : p);
        if (maxVal > globalMax) globalMax = maxVal;
      }
    }

    // 3. Construir los pasos de peso
    final List<double> stops = [];
    for (double w = 0; w < globalMax; w += weightStepKg) {
      stops.add(w);
    }
    stops.add(999); // rango "más de X kg"

    // 4. Generar grupos
    final List<Map<String, dynamic>> groups = [];
    for (final age in ages) {
      // Si unimos edades, tomamos el mínimo de la primera y el máximo de la última (asumiendo que están ordenadas)
      // Si no, tomamos el ageRange directo.
      int aMin = 99;
      int aMax = 0;
      if (mergeAges) {
         for (var a in selectedAges) {
            final rng = ageRanges[a]!;
            if (rng['min']! < aMin) aMin = rng['min']!;
            if (rng['max']! > aMax) aMax = rng['max']!;
         }
      } else {
         aMin = ageRanges[age]!['min']!;
         aMax = ageRanges[age]!['max']!;
      }

      for (final belt in selectedBelts) {
        final beltInfo = beltRanges[belt]!;
        final genders = mergeGenders ? ['Mixto'] : ['Masculino', 'Femenino'];
        for (final gender in genders) {
          double curMin = 0;
          for (int i = 0; i < stops.length - 1; i++) {
            final maxW = stops[i + 1];
            final weightLabel = maxW == 999
                ? '+${curMin.toInt()}kg'
                : '-${maxW.toInt()}kg';
            final ageName = mergeAges ? 'Edades Unidas' : age;
            final name = '$ageName $gender $belt $weightLabel';
            groups.add({
              'tournamentId': tournamentId,
              'name': name,
              'gender': gender,
              'ageMin': aMin,
              'ageMax': aMax,
              'weightMin': curMin,
              'weightMax': maxW == 999 ? 999.0 : maxW,
              'beltFromId': beltInfo['minId'],
              'beltToId': beltInfo['maxId'],
              'state': 'draft',
              'description':
                  'Generado compacto (step ${weightStepKg}kg)',
            });
            curMin = maxW + 0.1;
          }
        }
      }
    }
    return groups;
  }
}
