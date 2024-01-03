import 'package:dio/dio.dart';

class FeedbackResult {
  late String title;
  late String feedback;
  String keyword;
  String point;

  FeedbackResult({
    required this.title,
    required this.feedback,
    this.keyword = '',
    this.point = '',
  });

  factory FeedbackResult.fromJson(Response json) {
    return FeedbackResult(
      title: json.data['title'],
      feedback: json.data['feedback'],
      keyword: json.data['keyword'],
      point: json.data['point'],
    );
  }
}
