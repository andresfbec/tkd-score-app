import 'package:fluent_ui/fluent_ui.dart';

class JudgeCard extends StatelessWidget {
  final String name;
  final String category;
  final String document;
  final String phone;
  final String rank;
  final int tournaments;

  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const JudgeCard({
    super.key,
    required this.name,
    required this.category,
    required this.document,
    required this.phone,
    required this.rank,
    required this.tournaments,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final baseColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final hoverColor = isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF2F2F2);

    final borderColor = isDark
        ? Colors.white.withOpacity(0.06)
        : Colors.black.withOpacity(0.06);

    final mutedText = isDark
        ? Colors.white.withOpacity(0.6)
        : Colors.black.withOpacity(0.6);

    return HoverButton(
      onPressed: onTap,
      builder: (context, states) {
        final isHovering = states.isHovered;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isHovering ? hoverColor : baseColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 HEADER
              Row(
                children: [
                  /// Avatar neutro (Fluent)
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark
                          ? Colors.white.withOpacity(0.08)
                          : Colors.black.withOpacity(0.06),
                    ),
                    child: const Icon(FluentIcons.contact, size: 16),
                  ),

                  const SizedBox(width: 10),

                  /// Nombre + categoría
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 12,
                            color: mutedText,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Torneos (dato importante pero no principal)
                  Text(
                    'Torneos $tournaments',
                    style: TextStyle(
                      fontSize: 12,
                      color: mutedText,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// 🔹 DIVIDER
              Container(
                height: 1,
                color: borderColor,
              ),

              const SizedBox(height: 10),

              /// 🔹 INFO GRID (clave del cambio)
              Expanded(
                child: Row(
                  children: [
                    /// Columna izquierda
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _infoItem('Documento', document, mutedText),
                          const SizedBox(height: 6),
                          _infoItem('Teléfono', phone, mutedText),
                        ],
                      ),
                    ),

                    /// Columna derecha
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _infoItem('Rango', rank, mutedText),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔹 ACCIONES
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(FluentIcons.edit, size: 16),
                    onPressed: onEdit,
                  ),
                  IconButton(
                    icon: const Icon(FluentIcons.delete, size: 16),
                    onPressed: onDelete,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _infoItem(String label, String value, Color muted) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: muted,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}