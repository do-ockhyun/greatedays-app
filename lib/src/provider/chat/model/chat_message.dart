class ChatMessage {
  late bool isFeedback;
  late bool isImage;
  late String message;
  late DateTime typedAt;

  ChatMessage({
    this.isFeedback = false,
    this.isImage = false,
    required this.message,
    required this.typedAt,
  });
}
