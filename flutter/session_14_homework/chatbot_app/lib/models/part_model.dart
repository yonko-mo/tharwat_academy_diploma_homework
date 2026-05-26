class PartModel {
  final String text;
  final String? thoughtSignature;

  PartModel({required this.text, this.thoughtSignature});

  factory PartModel.fromJson(Map<String, dynamic> json) {
    return PartModel(
      text: json['text'] as String,
      thoughtSignature: json['thoughtSignature'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text,
    if (thoughtSignature != null) 'thoughtSignature': thoughtSignature,
  };
}
