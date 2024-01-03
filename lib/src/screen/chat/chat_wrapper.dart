import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/chat/chat_provider.dart';
import 'package:greatedays/src/provider/chat/model/chat_message.dart';
import 'package:greatedays/src/screen/chat/chat_screen.dart';
import 'package:provider/provider.dart';

class ChatWrapperScreen extends StatefulWidget {
  final String? diaryId;

  const ChatWrapperScreen({
    super.key,
    this.diaryId,
  });

  @override
  State<ChatWrapperScreen> createState() => _ChatWrapperState();
}

class _ChatWrapperState extends State<ChatWrapperScreen> {
  bool isNew = true;
  late List<ChatMessage> _chatList;

  @override
  void initState() {
    final id = widget.diaryId ?? '';
    if (id.isNotEmpty) {
      // TODO:
      // fetch diary by diaryId;
      _chatList = [];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isNew
          ? context.read<ChatProvider>().newChat()
          : context.read<ChatProvider>().readChat(_chatList),
      builder: (context, _) {
        //
        return const ChatScreen();
      },
    );
  }
}
