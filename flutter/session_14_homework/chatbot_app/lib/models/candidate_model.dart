import 'content_model.dart';

class CandidateModel {
  final ContentModel content;
  final String finishReason;
  final int index;

  CandidateModel({
    required this.content,
    required this.finishReason,
    required this.index,
  });

  factory CandidateModel.fromJson(Map<String, dynamic> json) {
    return CandidateModel(
      content: ContentModel.fromJson(json['content'] as Map<String, dynamic>),
      finishReason: json['finishReason'] as String,
      index: json['index'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'content': content.toJson(),
    'finishReason': finishReason,
    'index': index,
  };
}
