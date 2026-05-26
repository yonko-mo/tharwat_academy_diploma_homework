class TokenDetailModel {
  final String modality;
  final int tokenCount;

  TokenDetailModel({required this.modality, required this.tokenCount});

  factory TokenDetailModel.fromJson(Map<String, dynamic> json) {
    return TokenDetailModel(
      modality: json['modality'] as String,
      tokenCount: json['tokenCount'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'modality': modality,
    'tokenCount': tokenCount,
  };
}
