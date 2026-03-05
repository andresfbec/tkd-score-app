import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';

class UserBadge extends StatefulWidget {
  final String firstName;
  final String lastName;

  const UserBadge({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  @override
  State<UserBadge> createState() => _UserBadgeState();
}

class _UserBadgeState extends State<UserBadge> {
  bool _isHovered = false;

  String get initials {
    final firstInitial =
        widget.firstName.isNotEmpty ? widget.firstName[0].toUpperCase() : '';
    final lastInitial =
        widget.lastName.isNotEmpty ? widget.lastName[0].toUpperCase() : '';
    return '$firstInitial$lastInitial';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;

    final accent = theme.accentColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: _isHovered
              ? accent.withOpacity(0.08)
              : theme.resources.cardBackgroundFillColorSecondary,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: _isHovered
                ? accent.withOpacity(0.6)
                : theme.resources.controlStrokeColorDefault.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Avatar
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: accent.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(
                  color: accent.withOpacity(0.35),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  initials,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: AppTypography.semiBold,
                    color: accent,
                    height: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 6),

            // Nombre
            Text(
              '${widget.firstName} ${widget.lastName}',
              style: theme.typography.body?.copyWith(
                fontSize: 13,
                fontWeight: AppTypography.semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}