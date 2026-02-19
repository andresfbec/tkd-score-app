import 'package:fluent_ui/fluent_ui.dart';

class FluentDataTable extends StatelessWidget {
  final List<String> headers;
  final List<List<String>> rows;

  const FluentDataTable({
    super.key,
    required this.headers,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FluentTheme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[80]!.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Table(
        border: TableBorder.symmetric(
          inside: BorderSide(color: Colors.grey[80]!, width: 0.5),
        ),
        columnWidths: {
          for (int i = 0; i < headers.length; i++) i: const FlexColumnWidth(),
        },
        children: [
          // Header row
          TableRow(
            decoration: BoxDecoration(
              color: FluentTheme.of(context).accentColor.light.withOpacity(0.2),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            children: headers
                .map(
                  (header) => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      header,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: FluentTheme.of(context).accentColor.dark,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          // Data rows con hover en toda la fila
          for (var row in rows) _buildHoverableRow(context, row),
        ],
      ),
    );
  }

  TableRow _buildHoverableRow(BuildContext context, List<String> cells) {
    return TableRow(
      children: cells
          .map(
            (cell) => _HoverableCell(text: cell),
          )
          .toList(),
    );
  }
}

class _HoverableCell extends StatefulWidget {
  final String text;

  const _HoverableCell({required this.text});

  @override
  State<_HoverableCell> createState() => _HoverableCellState();
}

class _HoverableCellState extends State<_HoverableCell> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: _isHovered
              ? FluentTheme.of(context).accentColor.light.withOpacity(0.1)
              : Colors.transparent,
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}