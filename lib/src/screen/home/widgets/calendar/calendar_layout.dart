import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/calendar/calendar_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarLayout extends StatefulWidget {
  const CalendarLayout({super.key});

  @override
  State<CalendarLayout> createState() => _CalendarLayoutState();
}

class _CalendarLayoutState extends State<CalendarLayout> {
  CalendarStyle calStyle() {
    return const CalendarStyle(
      // today
      isTodayHighlighted: true,
      todayTextStyle: TextStyle(
        color: Color(0xFFFAFAFA),
        fontSize: 16.0,
      ),
      todayDecoration: BoxDecoration(
        color: Color(0xFF9FA8DA),
        shape: BoxShape.circle,
      ),

      // marker
      canMarkersOverflow: false,
      markersAutoAligned: true,
      markerSize: 10.0,
      markerSizeScale: 10.0,
      markersAnchor: 0.7,
      markerMargin: EdgeInsets.symmetric(horizontal: 0.3),
      markersAlignment: Alignment.bottomCenter,
      markersMaxCount: 4,
      markersOffset: PositionedOffset(),
      markerDecoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    var format = context.select((CalendarProvider cal) => cal.calendarFormat);
    var selectedDay = context.select((CalendarProvider cal) => cal.selectDay);

    return TableCalendar(
      headerVisible: false,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      currentDay: DateTime.now(),
      focusedDay: selectedDay,
      calendarFormat: format,
      calendarStyle: calStyle(),
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: (selected, focusedDay) {
        if (!isSameDay(selectedDay, selected)) {
          context.read<CalendarProvider>().select(selected);
        }
      },
      onCalendarCreated: (pageController) {
        context.read<CalendarProvider>().setController(pageController);
        Logger().d("Calendar Create !");
      },
    );
  }
}
