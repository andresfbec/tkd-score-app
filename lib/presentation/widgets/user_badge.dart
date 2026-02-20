import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';

class UserBadge extends StatefulWidget {
  final String userName;

  const UserBadge({super.key, required this.userName});

  @override
  State<UserBadge> createState() => _UserBadgeState();
}

class _UserBadgeState extends State<UserBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _isHovered
              ? theme.accentColor.light.withOpacity(0.1) // fondo al hover
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered
                ? theme.accentColor // borde más marcado al hover
                : theme.inactiveColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar circular
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: theme.accentColor.light.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.accentColor.light.withOpacity(0.4),
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  widget.userName.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    fontSize: AppTypography.bodySmall,
                    fontWeight: AppTypography.bold,
                    color: theme.accentColor,
                    height: 1, // Para centrar verticalmente el texto dentro del círculo
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Nombre
            Text(
              widget.userName,
              style: theme.typography.body?.copyWith(
                fontSize: AppTypography.bodySmall,
                fontWeight: AppTypography.semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}