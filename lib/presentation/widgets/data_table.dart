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
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: {
        for (int i = 0; i < headers.length; i++) i: const FlexColumnWidth(),
      },
      children: [
        // Header row
        TableRow(
          children: headers
              .map(
                (header) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    header,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        // Data rows
        for (var row in rows)
          TableRow(
            children: row
                .map(
                  (cell) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(cell, style: const TextStyle(color: Colors.black),),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}