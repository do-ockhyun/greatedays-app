import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greatedays/src/provider/calendar/calendar_provider.dart';
import 'package:greatedays/src/screen/home/widgets/calendar/calendar_handle_widget.dart';
import 'package:greatedays/src/screen/home/widgets/calendar/calendar_layout.dart';
import 'package:greatedays/src/screen/home/widgets/content/content_layout.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  PreferredSizeWidget appbar(BuildContext ctx) {
    var selected = ctx.select((CalendarProvider cal) => cal.selectDay);

    return AppBar(
      centerTitle: false,
      title: Text(
        "${selected.year}.${selected.month}",
        style: const TextStyle(color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).goNamed("chat");
          },
          icon: const Icon(Icons.add, color: Colors.black),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: const Column(
        children: [
          Column(
            children: [
              CalendarLayout(),
              CalendarHandleWidget(),
            ],
          ),

          //
          Expanded(
            child: ContentLayout(),
          ),
        ],
      ),
    );
  }
}
