import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:fluent_ui/fluent_ui.dart';

class CustomDataSource extends DataGridSource {
  final Function(Map<String, dynamic>)? onEdit;
  final Function(Map<String, dynamic>)? onDelete;

  CustomDataSource({
    required List<Map<String, dynamic>> data,
    required this.columns,
    required this.onRowSelected,
    this.onEdit,
    this.onDelete,
  }) {
    _dataGridRows = data.map<DataGridRow>((row) {
      return DataGridRow(
        cells: [
          ...columns.map((column) {
            return DataGridCell(
              columnName: column['key']!,
              value: row[column['key']] ?? '',
            );
          }),

          DataGridCell(columnName: '_original', value: row),
        ],
      );
    }).toList();
  }

  final List<Map<String, dynamic>> columns;
  final Function(Map<String, dynamic>) onRowSelected;

  late List<DataGridRow> _dataGridRows;

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final original =
        row.getCells().firstWhere((c) => c.columnName == '_original').value
            as Map<String, dynamic>;

    return DataGridRowAdapter(
      cells: [
        ...row
            .getCells()
            .where((cell) => cell.columnName != '_original')
            .map<Widget>((cell) {
              final columnConfig = columns.firstWhere(
                (col) => col['key'] == cell.columnName,
              );

              final renderer =
                  columnConfig['renderer'] as Widget Function(dynamic)?;

              Widget content;

              if (renderer != null) {
                content = renderer(cell.value);
              } else {
                content = Text(cell.value.toString());
              }

              return Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: content,
              );
            }),

        /// ACCIONES
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// EDITAR
              IconButton(
                icon: const Icon(FluentIcons.edit, size: 18),
                onPressed: () => onEdit?.call(original),
              ),

              const SizedBox(width: 4),

              /// ELIMINAR
              IconButton(
                icon: const Icon(FluentIcons.delete, size: 18),
                onPressed: () => onDelete?.call(original),
                style: ButtonStyle(
                  backgroundColor: ButtonState.resolveWith((states) {
                    if (states.isHovering) {
                      return const Color(0xFFD13438).withOpacity(0.15);
                    }
                    return Colors.transparent;
                  }),
                  foregroundColor: ButtonState.resolveWith((states) {
                    if (states.isHovering) {
                      return const Color(0xFFD13438);
                    }
                    return null;
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
