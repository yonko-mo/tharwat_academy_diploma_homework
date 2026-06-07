import 'package:chatbot_app/features/chat/data/models/content_model.dart';
import 'package:chatbot_app/features/chat/data/services/gemini_chat_service.dart';

class ChatRepo {
  final GeminiChatService geminiService = GeminiChatService();

  Future<ContentModel> sendMessage(List<ContentModel> messages) async {
    return await geminiService.sendMessage(messages);
  }
}
