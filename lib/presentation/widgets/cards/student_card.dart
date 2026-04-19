import 'package:fluent_ui/fluent_ui.dart';
import '../../../core/constants/app.dart';
import '../belt_indicator.dart';

class StudentCard extends StatelessWidget {
  final String fullName;
  final int age;
  final String idNumber;

  final Color leftBeltColor;
  final Color rightBeltColor;

  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onCopy;

  const StudentCard({
    super.key,
    required this.fullName,
    required this.age,
    required this.idNumber,
    required this.leftBeltColor,
    required this.rightBeltColor,
    this.onEdit,
    this.onDelete,
    this.onCopy,
  });

  String _getInitials(String name) {
    if (name.isEmpty) return "??";

    final parts = name.trim().split(RegExp(r'\s+'));

    if (parts.length >= 2) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }

    return parts[0][0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final mutedText = isDark
        ? Colors.white.withOpacity(0.6)
        : Colors.black.withOpacity(0.6);

    final borderColor = isDark
        ? Colors.white.withOpacity(0.08)
        : Colors.black.withOpacity(0.08);

    /// Color base de la card
    final baseColor = isDark
        ? const Color(0xFF1E1E1E)
        : const Color.fromARGB(255, 241, 239, 239); // más opaco que blanco

    final hoverColor = isDark
        ? const Color(0xFF2A2A2A)
        : const Color.fromARGB(255, 235, 232, 232);

    final avatarBg = isDark
    ? const Color.fromARGB(255, 83, 83, 83)
    : const Color.fromARGB(255, 197, 197, 197);

    final avatarTextColor = isDark
        ? Colors.white.withOpacity(0.9)
        : Colors.black.withOpacity(0.75);

    final FlyoutController controller = FlyoutController();

    return HoverButton(
      onPressed: () {},
      builder: (context, states) {
        final isHovering = states.isHovered;

        return Container(
          decoration: BoxDecoration(
            color: isHovering ? hoverColor : baseColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// FILA SUPERIOR
              Row(
                children: [
                  /// Avatar
                  Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: avatarBg,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _getInitials(fullName),
                    style: TextStyle(
                      color: avatarTextColor,
                      fontWeight: AppTypography.bold,
                      fontSize: 11,
                    ),
                  ),
                ),

                  const SizedBox(width: 12),

                  /// Nombre + metadata
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fullName,
                          style: const TextStyle(
                            fontSize: AppTypography.bodySmall,
                            fontWeight: AppTypography.semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$age años • CC $idNumber',
                          style: TextStyle(
                            color: mutedText,
                            fontSize: AppTypography.bodySmall,
                            fontWeight: AppTypography.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// BOTÓN OPCIONES
                  FlyoutTarget(
                    controller: controller,
                    child: IconButton(
                      icon: Icon(
                        FluentIcons.more_vertical,
                        size: 18,
                        color: mutedText,
                      ),
                      onPressed: () {
                        controller.showFlyout(
                          builder: (context) {
                            return MenuFlyout(
                              items: [
                                MenuFlyoutItem(
                                  leading: const Icon(FluentIcons.edit),
                                  text: const Text('Editar'),
                                  onPressed: onEdit,
                                ),

                                /// ELIMINAR CON ROJO
                                MenuFlyoutItem(
                                  leading: const Icon(
                                    FluentIcons.delete,
                                    color: AppColors.error,
                                  ),
                                  text: const Text(
                                    'Eliminar',
                                    style: TextStyle(color: AppColors.error),
                                  ),
                                  onPressed: onDelete,
                                ),

                                MenuFlyoutItem(
                                  leading: const Icon(FluentIcons.copy),
                                  text: const Text('Copiar'),
                                  onPressed: onCopy,
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// FILA INFERIOR
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ), // espacio para alinear con el texto de arriba
                  /// Etiqueta cinturón
                  BeltIndicator(
                    leftColor: leftBeltColor,
                    rightColor: rightBeltColor,
                  ),

                  const Spacer(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
