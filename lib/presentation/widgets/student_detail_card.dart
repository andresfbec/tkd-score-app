import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../core/theme/theme_provider.dart';

import '../mockers/students_mock.dart';

// functions utils (helpers)
import '../../core/utils/name_utils.dart';

class StudentCard extends StatelessWidget {
  final StudentMock student;
  final String headquarters;

  const StudentCard({
    super.key,
    required this.student,
    required this.headquarters,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    final isDark = theme.brightness == Brightness.dark;

    final initials = getInitials(student.names, student.surnames);
    final shortName = getShortName(student.names, student.surnames);

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? const Color.fromARGB(255, 41, 41, 41)
            : const Color.fromARGB(255, 238, 237, 237),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.08)
              : Colors.black.withOpacity(0.1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(isDark),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 44, 18, 16),
            child: Column(
              children: [
                _mainInfo(theme, shortName),
                const SizedBox(height: 14),
                _divider(),
                const SizedBox(height: 16),
                _badges(isDark),
                const SizedBox(height: 14),
                _detailsSection(isDark),
              ],
            ),
          ),
          _footer(),
        ],
      ),
    );
  }

  // 🔹 HEADER
  Widget _header(bool isDark) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            border: Border.all(color: Colors.black.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              Expanded(child: Container(color: student.rightBelt)),
              Expanded(child: Container(color: student.leftBelt)),
            ],
          ),
        ),
        Positioned(bottom: -30, child: _avatar(isDark)),
      ],
    );
  }

  // 🔹 AVATAR
  Widget _avatar(bool isDark) {
    final initials = getInitials(student.names, student.surnames);

    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDark
            ? const Color.fromARGB(255, 41, 41, 41)
            : const Color.fromARGB(255, 238, 237, 237),
        border: Border.all(color: student.leftBelt, width: 3),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  // 🔹 NOMBRE
  Widget _mainInfo(FluentThemeData theme, String shortName) {
    return Text(
      shortName,
      textAlign: TextAlign.center,
      style: theme.typography.title,
    );
  }

  Widget _divider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.withOpacity(0.18),
    );
  }

  // 🔹 DETALLES
  Widget _detailsSection(bool isDark) {
    final textColor = isDark ? Colors.white : Colors.black;

    return Column(
      children: [
        _itemFull("Nombre Completo", student.fullName, textColor),
        const SizedBox(height: 8),
        _itemFull(
          "Documento",
          "${student.typeIdentify} ${student.numberId}",
          textColor,
        ),
        const SizedBox(height: 8),
        _itemFull("Género", student.gender, textColor),
        const SizedBox(height: 8),
        _itemFull("Sede", headquarters, textColor),
        const SizedBox(height: 8),
        _itemFull(
          "Participaciones en torneos",
          student.participations.toString(),
          textColor,
          highlight: true,
        ),
      ],
    );
  }

  Widget _itemFull(
    String label,
    String value,
    Color textColor, {
    bool highlight = false,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 11, color: textColor.withOpacity(0.8)),
        ),
        const SizedBox(height: 2),
        highlight
            ? Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  letterSpacing: 0.5,
                  color: textColor,
                ),
              )
            : Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
              ),
      ],
    );
  }

  // 🔹 BADGES
  Widget _badges(bool isDark) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 6,
      children: [
        _badge(FluentIcons.calendar, "${student.age} años", isDark),
        _badge(FluentIcons.scale_volume, "${student.weight} kg", isDark),
        _badge(FluentIcons.generic_scan, "${student.height} m", isDark),
      ],
    );
  }

  Widget _badge(IconData icon, String text, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.grey.withOpacity(0.25)
            : Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: isDark ? Colors.white : Colors.black),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      height: 8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
      ),
      child: Row(
        children: [
          Expanded(child: Container(color: student.leftBelt)),
          Expanded(child: Container(color: student.rightBelt)),
        ],
      ),
    );
  }
}
