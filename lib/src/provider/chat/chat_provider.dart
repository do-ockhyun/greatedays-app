import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/chat/model/chat_message.dart';
import 'package:greatedays/src/provider/chat/model/network/feedback_response.dart';
import 'package:greatedays/src/utils/dio_network.dart';

class ChatProvider extends ChangeNotifier {
  final Network api = Network();

  ChatProvider();

  List<ChatMessage> _list = [];
  List<ChatMessage> get list => _list;

  Future<void> newChat() async {
    if (_list.isNotEmpty) return;

    _list.add(
      ChatMessage(
        message: "Default Question",
        isFeedback: true,
        typedAt: DateTime.now(),
      ),
    );
  }

  Future<void> readChat(List<ChatMessage> list) async {
    await Future.sync(() {
      _list = list;
    });
  }

  Future<void> clear() async {
    _list = [];
    notifyListeners();
  }

  Future<void> input(String msg) async {
    if (msg.isEmpty) return;

    await Future.sync(() {
      var updateList = _list.toList();
      updateList.add(ChatMessage(message: msg, typedAt: DateTime.now()));

      _list = updateList;
      notifyListeners();
    });
  }

  Future<FeedbackResult> sendMessage({required String msg}) async {
    Response response = await api.post("url", msg);
    return FeedbackResult.fromJson(response);
  }
}
