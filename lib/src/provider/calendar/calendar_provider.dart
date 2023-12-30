import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarProvider extends ChangeNotifier {
  CalendarProvider() {
    Logger().d("CalendarProvider on");
    _selectedDay = DateTime.now();
    _calendarFormat = CalendarFormat.month;
  }

  //
  late PageController _pageController;
  // PageController get pageController => _pageController;
  Future<void> setController(PageController controller) async {
    _pageController = controller;
  }

  Future<void> prev() async {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  Future<void> next() async {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  //
  late CalendarFormat _calendarFormat;
  CalendarFormat get calendarFormat => _calendarFormat;

  Future<void> changeFormat() async {
    if (_calendarFormat == CalendarFormat.month) {
      _calendarFormat = CalendarFormat.week;
    } else if (_calendarFormat == CalendarFormat.week) {
      _calendarFormat = CalendarFormat.month;
    }
    notifyListeners();
  }

  //
  late DateTime _selectedDay;
  DateTime get selectDay => _selectedDay;

  Future<void> select(DateTime select) async {
    _selectedDay = select;
    notifyListeners();
  }
}
