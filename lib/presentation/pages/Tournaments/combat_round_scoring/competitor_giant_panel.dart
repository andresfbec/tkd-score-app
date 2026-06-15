import 'package:fluent_ui/fluent_ui.dart';
import '../../../../domain/entities/point_types_entity.dart';

/// Panel con marcador masivo y botones reorganizados (2x3)
class CompetitorGiantPanel extends StatelessWidget {
  final String technicalName;
  final String competitorName;
  final bool isRed;
  final int score;
  final int penalties;
  final List<PointTypesEntity> pointTypes;
  final Function(PointTypesEntity pointType) onAction;

  const CompetitorGiantPanel({
    super.key,
    required this.technicalName,
    required this.competitorName,
    required this.isRed,
    required this.score,
    required this.penalties,
    required this.pointTypes,
    required this.onAction,
  });

  PointTypesEntity _getPointType(String bodyZone, String techniqueType, {bool isPenalty = false}) {
    return pointTypes.firstWhere(
      (p) => isPenalty ? p.isPenalty : (p.bodyZone == bodyZone && p.techniqueType == techniqueType),
      orElse: () => PointTypesEntity(
        id: isPenalty ? 6 : 0,
        name: isPenalty ? 'Gam-jeom (Penalización)' : 'Punto',
        pointsValue: 1,
        bodyZone: bodyZone,
        techniqueType: techniqueType,
        isPenalty: isPenalty,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final accentColor = isRed ? Colors.red : Colors.blue;

    final trunkPunch = _getPointType('TRUNK', 'PUNCH');
    final trunkKick = _getPointType('TRUNK', 'REGULAR_KICK');
    final trunkSpin = _getPointType('TRUNK', 'SPINNING_KICK');
    final headKick = _getPointType('HEAD', 'REGULAR_KICK');
    final headSpin = _getPointType('HEAD', 'SPINNING_KICK');
    final penalty = _getPointType('NONE', 'PENALTY', isPenalty: true);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
      child: Column(
        children: [
          // Identificador Técnico e Indicador Numérico
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    technicalName,
                    style: theme.typography.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: accentColor.normal,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    competitorName,
                    style: theme.typography.body?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: theme.typography.body?.color?.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'GAM-JEOM: $penalties',
                    style: theme.typography.body?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: penalties > 0 ? Colors.orange.normal : theme.typography.body?.color?.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 84,
                  fontWeight: FontWeight.w900,
                  color: theme.typography.title?.color,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // --- MATRIZ DE BOTONES 2x3 DYNAMIC ---
          Expanded(
            child: Column(
              children: [
                // FILA 1: TRUNK (3 botones)
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ScoringGridButton(
                          name: trunkPunch.name,
                          pointsValue: trunkPunch.pointsValue,
                          bodyZone: trunkPunch.bodyZone,
                          accentColor: accentColor,
                          onTap: () => onAction(trunkPunch),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ScoringGridButton(
                          name: trunkKick.name,
                          pointsValue: trunkKick.pointsValue,
                          bodyZone: trunkKick.bodyZone,
                          accentColor: accentColor,
                          onTap: () => onAction(trunkKick),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ScoringGridButton(
                          name: trunkSpin.name,
                          pointsValue: trunkSpin.pointsValue,
                          bodyZone: trunkSpin.bodyZone,
                          accentColor: accentColor,
                          onTap: () => onAction(trunkSpin),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // FILA 2: HEAD (2 botones) + PENALTY (1 botón)
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ScoringGridButton(
                          name: headKick.name,
                          pointsValue: headKick.pointsValue,
                          bodyZone: headKick.bodyZone,
                          accentColor: accentColor,
                          onTap: () => onAction(headKick),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ScoringGridButton(
                          name: headSpin.name,
                          pointsValue: headSpin.pointsValue,
                          bodyZone: headSpin.bodyZone,
                          accentColor: accentColor,
                          onTap: () => onAction(headSpin),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ScoringGridButton(
                          name: penalty.name,
                          pointsValue: penalty.pointsValue,
                          bodyZone: penalty.bodyZone,
                          accentColor: accentColor,
                          isPenalty: true,
                          onTap: () => onAction(penalty),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Botón modular con diseño de tarjeta interactiva Fluent UI
class ScoringGridButton extends StatelessWidget {
  final String name;
  final int pointsValue;
  final String bodyZone;
  final AccentColor accentColor;
  final bool isPenalty;
  final VoidCallback onTap;

  const ScoringGridButton({
    super.key,
    required this.name,
    required this.pointsValue,
    required this.bodyZone,
    required this.accentColor,
    this.isPenalty = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    Color badgeColor = theme.resources.cardBackgroundFillColorSecondary.withOpacity(0.06);

    if (isPenalty) {
      badgeColor = Colors.orange.normal.withOpacity(0.2);
    }

    return Card(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(10.0),
      borderColor: isPenalty
          ? Colors.orange.normal.withOpacity(0.3)
          : theme.resources.surfaceStrokeColorDefault.withOpacity(0.2),
      backgroundColor: isDarkMode
          ? theme.resources.solidBackgroundFillColorBase.withOpacity(0.6)
          : theme.resources.solidBackgroundFillColorBase,
      child: Button(
        style: ButtonStyle(
          backgroundColor: ButtonState.all(Colors.transparent),
          elevation: ButtonState.all(0.0),
          shape: ButtonState.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      bodyZone,
                      style: theme.typography.caption?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        letterSpacing: 0.5,
                        color: isPenalty ? Colors.orange.normal : null,
                      ),
                    ),
                  ),
                  Text(
                    isPenalty ? '⚠️' : '+$pointsValue',
                    style: theme.typography.bodyStrong?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: isPenalty ? Colors.orange.normal : accentColor.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: theme.typography.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
