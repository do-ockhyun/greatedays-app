import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/calendar/calendar_provider.dart';
import 'package:greatedays/src/provider/chat/chat_provider.dart';
import 'package:greatedays/src/screen/chat/widgets/chat_keyboard_widget.dart';
import 'package:greatedays/src/screen/chat/widgets/chat_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
    final chatList = context.select((ChatProvider c) => c.list);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appbar(context),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ...chatList.map((e) => Chat(msg: e)),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bottom Keyboard layout
          const BottomKeyboardSheet("keyword"),
        ],
      ),
    );
  }
}
