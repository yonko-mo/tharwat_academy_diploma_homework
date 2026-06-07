import 'part_model.dart';

class ContentModel {
  final List<PartModel> parts;
  final String role;

  ContentModel({required this.parts, required this.role});

  factory ContentModel.fromUser(String text) {
    return ContentModel(
      parts: [PartModel(text: text)],
      role: 'user',
    );
  }

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      parts: (json['parts'] as List)
          .map((e) => PartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'parts': parts.map((e) => e.toJson()).toList(),
    'role': role,
  };
}
