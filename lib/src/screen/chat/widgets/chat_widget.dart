import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/chat/model/chat_message.dart';
import 'package:sizer/sizer.dart';

class Chat extends StatelessWidget {
  final ChatMessage msg;
  final ChatMessage? nextMsg;

  const Chat({
    super.key,
    required this.msg,
    this.nextMsg,
  });

  Widget chatDate(Alignment align) {
    if (nextMsg == null) {
      return Container(
        margin: const EdgeInsets.all(5),
        alignment: align,
        child: Text('${msg.typedAt.hour}:${msg.typedAt.minute}'),
      );
    }

    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final align = msg.isFeedback ? Alignment.centerLeft : Alignment.centerRight;

    return Container(
      width: 100.w,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      alignment: align,
      child: Column(
        crossAxisAlignment:
            msg.isFeedback ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            constraints: BoxConstraints(
              minWidth: 40,
              maxWidth: 100.w / 2,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: msg.isFeedback ? Colors.grey[300] : Colors.blue[100],
            ),
            child: Text(msg.message, softWrap: true),
          ),

          //
          chatDate(align),
        ],
      ),
    );
  }
}
