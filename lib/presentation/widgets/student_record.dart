import 'package:fluent_ui/fluent_ui.dart';

class StudentCard extends StatelessWidget {
  final String initials;
  final String fullName;
  final String firstName;
  final String lastName;
  final String documentType;
  final String documentId;
  final int age;
  final String gender;
  final double weight;
  final double height;
  final int tournaments;
  final String headquarters;
  final Color beltColor;
  final String participations;

  const StudentCard({
    super.key,
    required this.initials,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.documentType,
    required this.documentId,
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    required this.tournaments,
    required this.headquarters,
    required this.beltColor,
    required this.participations,
  });

  String get shortName {
    final first = firstName.split(" ").first;
    final last = lastName.split(" ").first;
    return "$first $last";
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
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
          _header(),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 44, 18, 16), // 🔽 bajamos un poco
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _mainInfo(context),

                const SizedBox(height: 14), // 🔽 antes 14

                _divider(),

                const SizedBox(height: 16), // 🔽 antes 16

                _badges(),

                const SizedBox(height: 14), // 🔽 antes 14

                _detailsSection(),
              ],
            ),
          ),
          _footer(),
        ],
      ),
    );
  }

  // 🔹 HEADER
  Widget _header() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: beltColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
        ),
        Positioned(
          bottom: -30,
          child: _avatar(),
        ),
      ],
    );
  }

  Widget _avatar() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: beltColor, width: 3),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 🔹 NOMBRE
  Widget _mainInfo(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Text(
      shortName,
      textAlign: TextAlign.center,
      style: theme.typography.title?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
    );
  }

  // 🔹 DIVIDER
  Widget _divider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.withOpacity(0.18),
    );
  }

  // 🔹 DETALLES
  Widget _detailsSection() {
    return Column(
      children: [
        _itemFull("Nombre Completo", "$firstName $lastName"),
        const SizedBox(height: 8), // 🔽 antes 10

        _itemFull("Documento", "$documentType $documentId"),
        const SizedBox(height: 8),

        _itemFull("Género", gender),
        const SizedBox(height: 8),

        _itemFull("Sede", headquarters),
        const SizedBox(height: 6), // 🔽 reducimos antes del highlight

        _itemFull("Participaciones", participations, highlight: true),
      ],
    );
  }

  // 🔹 ITEM NORMAL / DESTACADO
  Widget _itemFull(String label, String value, {bool highlight = false}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: highlight ? 10 : 11,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 2), // 🔽 menos espacio
        highlight
            ? Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 34, // 🔥 grande pero controlado
                  letterSpacing: 0.5,
                  color: beltColor,
                ),
              )
            : Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
      ],
    );
  }

  // 🔹 BADGES
  Widget _badges() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 6,
      children: [
        _badge(FluentIcons.calendar, "$age años"),
        _badge(FluentIcons.scale_volume, "$weight kg"),
        _badge(FluentIcons.generic_scan, "$height m"),
      ],
    );
  }

  // 🔹 BADGE
  Widget _badge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.grey[130]),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  // 🔹 FOOTER
  Widget _footer() {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: beltColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
      ),
    );
  }
}