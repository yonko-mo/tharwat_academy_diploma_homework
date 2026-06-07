import 'package:chatbot_app/features/chat/data/models/content_model.dart';
import 'package:chatbot_app/core/network/api_client.dart';
import 'package:chatbot_app/secrets.dart';

class GeminiChatService {
  final ApiClient apiClient = ApiClient();

  Future<ContentModel> sendMessage(List<ContentModel> messages) async {
    var data = await apiClient.post(
      url:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash:generateContent',
      data: {"contents": messages.map((message) => message.toJson()).toList()},
      headers: {'x-goog-api-key': apiKey, 'Content-Type': 'application/json'},
    );

    var messageMap = data['candidates'][0]['content'];
    return ContentModel.fromJson(messageMap);
  }
}
