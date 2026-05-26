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

  /// Get the generated text from the first candidate's first part
  String get generatedText {
    if (candidates.isEmpty || candidates.first.content.parts.isEmpty) {
      return '';
    }
    return candidates.first.content.parts.first.text;
  }

  /// Get the finish reason from the first candidate
  String get finishReason {
    if (candidates.isEmpty) {
      return '';
    }
    return candidates.first.finishReason;
  }

  /// Check if the response has valid content
  bool get hasContent =>
      candidates.isNotEmpty &&
      candidates.first.content.parts.isNotEmpty &&
      candidates.first.content.parts.first.text.isNotEmpty;

  /// Get the total number of tokens used in this request
  int get totalTokens => usageMetadata.totalTokenCount;

  /// Get the number of tokens used for the prompt
  int get promptTokens => usageMetadata.promptTokenCount;

  /// Get the number of tokens used for the response
  int get responseTokens => usageMetadata.candidatesTokenCount;

  /// Check if the response was successful (STOP finish reason)
  bool get isSuccessful => finishReason == 'STOP' && hasContent;
}
