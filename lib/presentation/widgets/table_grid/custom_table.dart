import 'package:fluent_ui/fluent_ui.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'custom_data_source.dart';

import '../../../core/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../core/constants/app.dart';

class CustomTable extends StatefulWidget {
  final List<Map<String, dynamic>> columns;
  final List<Map<String, dynamic>> data;
  final Function(Map<String, dynamic>) onRowSelected;

  const CustomTable({
    super.key,
    required this.columns,
    required this.data,
    required this.onRowSelected,
  });

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  late CustomDataSource _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = CustomDataSource(
      data: widget.data,
      columns: widget.columns,
      onRowSelected: widget.onRowSelected,
    );
  }

  @override
  void didUpdateWidget(CustomTable oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.data != widget.data) {
      _dataSource = CustomDataSource(
        data: widget.data,
        columns: widget.columns,
        onRowSelected: widget.onRowSelected,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final accent = themeProvider.accentColor;
    final isDark = themeProvider.isDarkMode;
    final fluentTheme = themeProvider.currentTheme;
    final headerTextColor = isDark ? Colors.white : Colors.black;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? fluentTheme.cardColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.4 : 0.08),
            blurRadius: 20,
            spreadRadius: -4,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SfDataGridTheme(
          data: SfDataGridThemeData(
            headerColor: isDark
                ? fluentTheme.resources.controlFillColorSecondary
                : fluentTheme.cardColor,
            headerHoverColor: accent.withOpacity(0.08),
            selectionColor: accent.withOpacity(
              isDark ? 0.25 : 0.15,
            ), // color de selección con opacidad
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final rowHeight = 48.0;
              final headerRight = 52.0;
              final totalHeight =
                  (widget.data.length * rowHeight) +
                  rowHeight; // altura total de filas + header
              final maxHeight = constraints.maxHeight;

              return SizedBox(
                height: totalHeight > maxHeight ? maxHeight : totalHeight,
                child: SfDataGrid(
        source: _dataSource,
        selectionMode: SelectionMode.single,
        navigationMode: GridNavigationMode.row,
        columnWidthMode: ColumnWidthMode.fill,
        allowSorting: true,
        highlightRowOnHover: true,
        headerRowHeight: 52,
        rowHeight: 48,
        gridLinesVisibility: GridLinesVisibility.horizontal,
        headerGridLinesVisibility: GridLinesVisibility.horizontal,
        columns: [
          ...widget.columns.map(
            (column) => GridColumn(
              columnName: column['key']!,
              width: column['width'] != null
                ? column['width'] as double
                : double.nan,
              label: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                column['label']!,
                style: fluentTheme.typography.title?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: AppTypography.bodySmall,
                  color: headerTextColor,
                ),
              ),
            ),
            ),
          ),
          GridColumn(
          columnName: 'actions',
          width: 130,
          label: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Acciones',
            style: fluentTheme.typography.title?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: AppTypography.bodySmall,
              color: headerTextColor,
            ),
          ),
        ),

        ),

        ],
        onSelectionChanged: (addedRows, removedRows) {
          if (addedRows.isNotEmpty) {
            final row = addedRows.first;
            final data = <String, dynamic>{};

            for (var cell in row.getCells()) {
              data[cell.columnName] = cell.value;
            }

            widget.onRowSelected(data);
          }
        },
      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
