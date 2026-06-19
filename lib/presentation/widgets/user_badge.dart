import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';

class UserBadge extends StatefulWidget {
  final String firstName;
  final String lastName;

  const UserBadge({super.key, required this.firstName, required this.lastName});

  @override
  State<UserBadge> createState() => _UserBadgeState();
}

class _UserBadgeState extends State<UserBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark
        ? Colors.white.withOpacity(0.95)
        : Colors.black.withOpacity(0.95);
    final hoverColor = isDark
        ? Colors.white.withOpacity(0.12)
        : Colors.black.withOpacity(0.08);

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: _isHovered ? hoverColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.firstName} ${widget.lastName}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: AppTypography.semiBold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
