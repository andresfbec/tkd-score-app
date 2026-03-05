// lib/presentation/widgets/date_badge.dart
// Widget personalizado (prueba)
// Actualmente NO utilizado


import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart' as material;
import '../../../core/theme/theme_provider.dart';

class DateBadge extends StatefulWidget {
  final VoidCallback? onDateSelected;

  const DateBadge({Key? key, this.onDateSelected}) : super(key: key);

  @override
  State<DateBadge> createState() => _DateBadgeState();
}

class _DateBadgeState extends State<DateBadge> {
  DateTime _selectedDate = DateTime.now();
  bool _isOpen = false;
  bool _isHovering = false;

  final GlobalKey _badgeKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  String get _formattedDate {
    return DateFormat('EEE dd MMM', 'es').format(_selectedDate);
  }

  void _toggleCalendar() {
    if (_overlayEntry == null) {
      _showCalendar();
    } else {
      _removeCalendar();
    }
  }

  void _showCalendar() {
    final renderBox =
        _badgeKey.currentContext!.findRenderObject() as RenderBox;

    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _removeCalendar,
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              left: position.dx - 100,
              top: position.dy + size.height + 4,
              child: _buildCalendar(),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);

    setState(() {
      _isOpen = true;
    });
  }

  void _removeCalendar() {
    _overlayEntry?.remove();
    _overlayEntry = null;

    setState(() {
      _isOpen = false;
    });
  }

  Widget _buildCalendar() {
    final theme = FluentTheme.of(context);

    return material.Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(6),
      child: material.Theme(
        data: material.ThemeData(
          brightness: theme.brightness == Brightness.dark
              ? material.Brightness.dark
              : material.Brightness.light,
          colorScheme: material.ColorScheme.fromSeed(
            seedColor: theme.accentColor.defaultBrushFor(
              material.Brightness.light,
            ),
            brightness: theme.brightness == Brightness.dark
                ? material.Brightness.dark
                : material.Brightness.light,
          ),
        ),
        child: Container(
          width: 300,
          height: 350,
          decoration: BoxDecoration(
            color: theme.brightness == Brightness.dark
            ? const Color(0xFF202020)
            : Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: material.CalendarDatePicker(
            initialDate: _selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            onDateChanged: (date) {
              setState(() {
                _selectedDate = date;
              });

              print(
                "Fecha seleccionada: ${DateFormat('yyyy-MM-dd').format(date)}",
              );

              _removeCalendar();

              widget.onDateSelected?.call();
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    final accent = theme.accentColor;

    return 
    MouseRegion(
  onEnter: (_) {
    setState(() => _isHovering = true);
  },
  onExit: (_) {
    setState(() => _isHovering = false);
  },
  child:GestureDetector(
      key: _badgeKey,
      onTap: _toggleCalendar,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _isOpen
          ? accent.withOpacity(0.12)
          : _isHovering
              ? accent.withOpacity(0.08)
              : theme.resources.cardBackgroundFillColorSecondary,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
          color: _isHovering
              ? accent
              : theme.resources.controlStrokeColorDefault,
          width: 1,
        ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _formattedDate,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: theme.typography.body?.color,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              _isOpen ? FluentIcons.chevron_up : FluentIcons.chevron_down,
              size: 12,
              color: theme.resources.textFillColorSecondary,
            ),
          ],
        ),
      ),
    )
    );
  }
}