import 'package:fluent_ui/fluent_ui.dart';

/// Entrada de log para puntuaciones
class ScoreLogEntry {
  final int points;
  final bool isPenalty;
  final String techniqueName;
  final DateTime timestamp;

  ScoreLogEntry({
    required this.points,
    required this.isPenalty,
    required this.techniqueName,
    required this.timestamp,
  });

  String get formattedTime {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}:${timestamp.second.toString().padLeft(2, '0')}';
  }
}

/// Footer con logs de puntos para ambos competidores
class ScoreLogFooter extends StatelessWidget {
  final List<ScoreLogEntry> blueLogs;
  final List<ScoreLogEntry> redLogs;

  const ScoreLogFooter({
    super.key,
    required this.blueLogs,
    required this.redLogs,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withOpacity(0.85),
        border: Border(
          top: BorderSide(
            color: theme.resources.surfaceStrokeColorDefault.withOpacity(0.3),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          // Log Azul
          Expanded(
            child: LogColumn(
              title: 'CHUNG · Últimos Puntos',
              logs: blueLogs,
              isBlue: true,
            ),
          ),
          // Separador sutil
          Container(
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: theme.resources.surfaceStrokeColorDefault.withOpacity(0.2),
          ),
          // Log Rojo
          Expanded(
            child: LogColumn(
              title: 'HONG · Últimos Puntos',
              logs: redLogs,
              isBlue: false,
            ),
          ),
        ],
      ),
    );
  }
}

class LogColumn extends StatelessWidget {
  final String title;
  final List<ScoreLogEntry> logs;
  final bool isBlue;

  const LogColumn({
    super.key,
    required this.title,
    required this.logs,
    required this.isBlue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final accentColor = isBlue ? Colors.blue : Colors.red;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: theme.typography.caption?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: accentColor.normal.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
        if (logs.isEmpty)
          Text(
            'Sin puntos registrados',
            style: theme.typography.caption?.copyWith(
              color: theme.typography.caption?.color?.withOpacity(0.4),
            ),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: logs.map((log) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: log.isPenalty
                      ? Colors.orange.normal.withOpacity(0.15)
                      : accentColor.normal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: log.isPenalty
                        ? Colors.orange.normal.withOpacity(0.3)
                        : accentColor.normal.withOpacity(0.2),
                    width: 0.5,
                  ),
                ),
                child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    log.techniqueName,
                    style: theme.typography.caption?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 1,
                    height: 12,
                    color: theme.typography.caption?.color?.withOpacity(0.3),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    log.isPenalty ? '⚠️' : '+${log.points}',
                    style: theme.typography.caption?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: log.isPenalty ? Colors.orange.normal : accentColor.normal,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    log.formattedTime,
                    style: theme.typography.caption?.copyWith(
                      fontSize: 9,
                      color: theme.typography.caption?.color?.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
