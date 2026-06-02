import 'candidate_model.dart';
import 'usage_metadata_model.dart';

class GeminiResponseModel {
  final List<CandidateModel> candidates;
  final UsageMetadataModel usageMetadata;
  final String modelVersion;
  final String responseId;

  GeminiResponseModel({
    required this.candidates,
    required this.usageMetadata,
    required this.modelVersion,
    required this.responseId,
  });

  factory GeminiResponseModel.fromJson(Map<String, dynamic> json) {
    return GeminiResponseModel(
      candidates: (json['candidates'] as List)
          .map((e) => CandidateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageMetadata: UsageMetadataModel.fromJson(
        json['usageMetadata'] as Map<String, dynamic>,
      ),
      modelVersion: json['modelVersion'] as String,
      responseId: json['responseId'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'candidates': candidates.map((e) => e.toJson()).toList(),
    'usageMetadata': usageMetadata.toJson(),
    'modelVersion': modelVersion,
    'responseId': responseId,
  };

  String get generatedText {
    if (candidates.isEmpty || candidates.first.content.parts.isEmpty) {
      return '';
    }
    return candidates.first.content.parts.first.text;
  }

  String get finishReason {
    if (candidates.isEmpty) {
      return '';
    }
    return candidates.first.finishReason;
  }

  bool get hasContent =>
      candidates.isNotEmpty &&
      candidates.first.content.parts.isNotEmpty &&
      candidates.first.content.parts.first.text.isNotEmpty;

  int get totalTokens => usageMetadata.totalTokenCount;

  int get promptTokens => usageMetadata.promptTokenCount;

  int get responseTokens => usageMetadata.candidatesTokenCount;

  bool get isSuccessful => finishReason == 'STOP' && hasContent;
}
