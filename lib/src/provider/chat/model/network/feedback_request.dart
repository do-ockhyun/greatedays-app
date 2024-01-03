class FeedBack {
  final String content;

  FeedBack({required this.content});

  Map<String, dynamic> toJson() {
    return {
      'content': content,
    };
  }
}
