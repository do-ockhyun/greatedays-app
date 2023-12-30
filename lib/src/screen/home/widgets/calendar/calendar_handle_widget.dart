import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/calendar/calendar_provider.dart';
import 'package:provider/provider.dart';

class CalendarHandleWidget extends StatefulWidget {
  const CalendarHandleWidget({super.key});

  @override
  State<CalendarHandleWidget> createState() => _CalendarHandleWidgetState();
}

class _CalendarHandleWidgetState extends State<CalendarHandleWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => context.read<CalendarProvider>().prev(),
            icon: const Icon(Icons.chevron_left_rounded),
          ),
          IconButton(
            onPressed: () => context.read<CalendarProvider>().changeFormat(),
            icon: const Icon(Icons.change_circle_rounded),
          ),
          IconButton(
            onPressed: () => context.read<CalendarProvider>().next(),
            icon: const Icon(Icons.chevron_right_outlined),
          ),
        ],
      ),
    );
  }
}
