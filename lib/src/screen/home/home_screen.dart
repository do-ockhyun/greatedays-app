import 'package:flutter/material.dart';
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalendarProvider()),
      ],
      child: Builder(
        builder: (ctx) {
          return Scaffold(
            appBar: appbar(ctx),
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
        },
      ),
    );
  }
}
