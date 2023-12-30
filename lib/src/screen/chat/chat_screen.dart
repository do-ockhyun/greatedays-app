import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/calendar/calendar_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //
  PreferredSizeWidget appbar(BuildContext ctx) {
    var selected = ctx.select((CalendarProvider cal) => cal.selectDay);

    return AppBar(
      centerTitle: false,
      title: Text("${selected.year}.${selected.month}"),
      elevation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: const Center(
        child: Text("chat screen"),
      ),
    );
  }
}
