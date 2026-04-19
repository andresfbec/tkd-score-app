import 'package:fluent_ui/fluent_ui.dart';

class HeadquartersGrid extends StatelessWidget {
  final List<Map<String, String>> headquarters;

  const HeadquartersGrid({super.key, required this.headquarters});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // número de columnas
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 4 / 3, // proporción de la card
      ),
      itemCount: headquarters.length,
      itemBuilder: (context, index) {
        final hq = headquarters[index];
        return HoverCard(
          child: Container(
            decoration: BoxDecoration(
              color: FluentTheme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[80]!.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
              border: Border.all(
                color: FluentTheme.of(context).accentColor.light.withOpacity(0.3),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hq['name'] ?? '',
                  style: FluentTheme.of(context).typography.title?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text("Dirección: ${hq['address']}"),
                Text("Ciudad: ${hq['city']}"),
                Text("Teléfono: ${hq['phoneNumber']}"),
                Text("Estado: ${hq['status']}"),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Card con efecto hover
class HoverCard extends StatefulWidget {
  final Widget child;
  const HoverCard({super.key, required this.child});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.02))
            : Matrix4.identity(),
        child: widget.child,
      ),
    );
  }
}