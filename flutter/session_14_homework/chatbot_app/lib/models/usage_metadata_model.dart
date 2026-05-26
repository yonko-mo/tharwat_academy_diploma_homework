import 'token_detail_model.dart';

class UsageMetadataModel {
  final int promptTokenCount;
  final int candidatesTokenCount;
  final int totalTokenCount;
  final List<TokenDetailModel> promptTokensDetails;
  final int thoughtsTokenCount;
  final String serviceTier;

  UsageMetadataModel({
    required this.promptTokenCount,
    required this.candidatesTokenCount,
    required this.totalTokenCount,
    required this.promptTokensDetails,
    required this.thoughtsTokenCount,
    required this.serviceTier,
  });

  factory UsageMetadataModel.fromJson(Map<String, dynamic> json) {
    return UsageMetadataModel(
      promptTokenCount: json['promptTokenCount'] as int,
      candidatesTokenCount: json['candidatesTokenCount'] as int,
      totalTokenCount: json['totalTokenCount'] as int,
      promptTokensDetails: (json['promptTokensDetails'] as List)
          .map((e) => TokenDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      thoughtsTokenCount: json['thoughtsTokenCount'] as int,
      serviceTier: json['serviceTier'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'promptTokenCount': promptTokenCount,
    'candidatesTokenCount': candidatesTokenCount,
    'totalTokenCount': totalTokenCount,
    'promptTokensDetails': promptTokensDetails.map((e) => e.toJson()).toList(),
    'thoughtsTokenCount': thoughtsTokenCount,
    'serviceTier': serviceTier,
  };
}
