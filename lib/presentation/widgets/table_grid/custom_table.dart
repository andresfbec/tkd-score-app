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
  final Map<String, dynamic>? selectedRow;
  final bool Function(Map<String, dynamic>, Map<String, dynamic>) isSameRow;

  const CustomTable({
    super.key,
    required this.columns,
    required this.data,
    required this.onRowSelected,
    required this.isSameRow,
    this.selectedRow,
  });

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  late CustomDataSource _dataSource;
  final DataGridController _controller = DataGridController();

  @override
  void initState() {
    super.initState();
    _dataSource = CustomDataSource(
      data: widget.data,
      columns: widget.columns,
      onRowSelected: widget.onRowSelected,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncSelection();
    });
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

    /// CLAVE: cuando cambia selectedRow → actualizamos selección
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncSelection();
    });
  }

  /// Encuentra la fila que corresponde al selectedRow del provider
  DataGridRow? _getSelectedDataGridRow() {
    if (widget.selectedRow == null) return null;

    try {
      return _dataSource.rows.firstWhere((row) {
        final original =
            row.getCells().firstWhere((c) => c.columnName == '_original').value
                as Map<String, dynamic>;

        // Usamos la funcion isSameRow para comparar la fila original con la fila seleccionada del provider
        // ya que al hacer (rebuild, filtros, etc) ya  no son la misma referencia en memoria, aunque representen el mismo dato por eso comparamos por id o campos unicos
        return widget.isSameRow(original, widget.selectedRow!);
      });
    } catch (e) {
      return null;
    }
  }

  /// Aplica la selección al DataGrid
  void _syncSelection() {
    final selected = _getSelectedDataGridRow();

    if (selected != null) {
      final index = _dataSource.rows.indexOf(selected);
      _controller.selectedIndex = index;

      /// FIX delay para esperar a que el DataGrid actualice su estado interno antes de hacer scroll
      Future.delayed(const Duration(milliseconds: 50), () {
        if (mounted && _controller.selectedIndex != -1) {
          try {
            _controller.scrollToRow(index.toDouble());
          } catch (_) {}
        }
      });

      // Scroll automatico
    } else {
      _controller.selectedIndex = -1;
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
            selectionColor: accent.withOpacity(isDark ? 0.25 : 0.15),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final rowHeight = 48.0;
              final headerRight = 52.0;
              final totalHeight =
                  (widget.data.length * rowHeight) +
                  rowHeight; // altura total de filas + header
              final maxHeight = constraints.maxHeight;

              if (widget.data.isEmpty) {
                return SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      'No hay datos disponibles',
                      style: fluentTheme.typography.body?.copyWith(
                        fontSize: 16,
                        color: isDark
                            ? Colors.white.withOpacity(0.7)
                            : Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ),
                );
              }

              return SizedBox(
                height: totalHeight > maxHeight ? maxHeight : totalHeight,
                child: SfDataGrid(
                  controller: _controller, // IMPORTANTE
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

                      final original =
                          row
                                  .getCells()
                                  .firstWhere(
                                    (c) => c.columnName == '_original',
                                  )
                                  .value
                              as Map<String, dynamic>;

                      widget.onRowSelected(original);
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
