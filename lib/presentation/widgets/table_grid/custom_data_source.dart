import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:fluent_ui/fluent_ui.dart';

class CustomDataSource extends DataGridSource {
  CustomDataSource({
    required List<Map<String, dynamic>> data,
    required this.columns,
    required this.onRowSelected,
  }) {
    _dataGridRows = data.map<DataGridRow>((row) {
      return DataGridRow(
        cells: columns.map((column) {
          return DataGridCell(
            columnName: column['key']!,
            value: row[column['key']],
          );
        }).toList(),
      );
    }).toList();
  }

  final List<Map<String, String>> columns;
  final Function(Map<String, dynamic>) onRowSelected;

  late List<DataGridRow> _dataGridRows;

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: [
        ...row.getCells().map<Widget>((cell) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(cell.value.toString()),
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
                icon: const Icon(
                  FluentIcons.edit,
                  size: 18,
                ),
                onPressed: () {},
              ),

              const SizedBox(width: 4),

              /// ELIMINAR
              IconButton(
                icon: const Icon(
                  FluentIcons.delete,
                  size: 18,
                ),
                onPressed: () {},
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