// Widget personalizado para el calendario de torneos
// Usa la librería table_calendar para mostrar un calendario desplegable
// Actualmente usado en el AppShell (deberia permitir seleccionar fecha para creacion de torneos y mostrar eventos futuros)

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/constants/app.dart';

class TournamentCalendar extends StatefulWidget {
  final Function(DateTime date)? onDateSelected;

  const TournamentCalendar({super.key, this.onDateSelected});

  @override
  State<TournamentCalendar> createState() => _TournamentCalendarState();
}

class _TournamentCalendarState extends State<TournamentCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool _isOpen = false;
  bool _isHovering = false;

  final GlobalKey _badgeKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  /// EVENTOS (torneos futuros)
  final Map<DateTime, List<String>> _events = {};

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  String get _formattedDate {
    return DateFormat(
      'EEE dd MMM',
      'es',
    ).format(_selectedDay ?? DateTime.now());
  }

  void _toggleCalendar() {
    if (_overlayEntry == null) {
      _showCalendar();
    } else {
      _removeCalendar();
    }
  }

  void _showCalendar() {
    final renderBox = _badgeKey.currentContext!.findRenderObject() as RenderBox;

    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        final theme = FluentTheme.of(context);
        final accent = theme.accentColor;

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
              child: material.Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 320,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.brightness == Brightness.dark
                        ? const Color(0xFF2B2B2B)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _isHovering
                          ? theme.resources.controlStrokeColorDefault
                                .withOpacity(0.6)
                          : theme.resources.controlStrokeColorDefault
                                .withOpacity(0.4),
                      width: 1,
                    ),
                  ),

                  child: TableCalendar(
                    locale: 'es_ES',

                    firstDay: DateTime.utc(2020),
                    lastDay: DateTime.utc(2035),

                    focusedDay: _focusedDay,

                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },

                    eventLoader: _getEventsForDay,

                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });

                      widget.onDateSelected?.call(selectedDay);

                      _removeCalendar();
                    },

                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: accent.withOpacity(.25),
                        shape: BoxShape.circle,
                      ),

                      selectedDecoration: BoxDecoration(
                        color: accent,
                        shape: BoxShape.circle,
                      ),

                      markerDecoration: BoxDecoration(
                        color: accent,
                        shape: BoxShape.circle,
                      ),

                      defaultTextStyle: TextStyle(
                        color: theme.typography.body?.color,
                      ),

                      weekendTextStyle: TextStyle(
                        color: theme.typography.body?.color,
                      ),
                    ),

                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        color: theme.typography.body?.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '${day.day}',
                              style: TextStyle(
                                color: theme.typography.body?.color,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
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

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final accent = theme.accentColor;
    final isDark = theme.brightness == Brightness.dark;
    final hoverColor = isDark
        ? Colors.white.withOpacity(0.12)
        : Colors.black.withOpacity(0.08);

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        key: _badgeKey,
        onTap: _toggleCalendar,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: (_isOpen || _isHovering)
                ? hoverColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _formattedDate,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: AppTypography.medium,
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
      ),
    );
  }
}
