import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbot_app/features/chat/data/models/message_model.dart';
import 'package:chatbot_app/features/chat/data/services/gemini_service.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GeminiService geminiService;
  final List<MessageModel> messages = [];

  ChatCubit({required this.geminiService}) : super(ChatInitialState());

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    messages.add(MessageModel(isUserMessage: true, message: text));
    emit(ChatLoadingState());

    try {
      final response = await geminiService.generateContent(text);
      messages.add(
        MessageModel(isUserMessage: false, message: response.generatedText),
      );
      emit(ChatSuccessState(messages: messages));
    } catch (e) {
      messages.removeLast();
      final error = e.toString().replaceFirst('Exception: ', '');
      emit(ChatErrorState(errorMessage: error));
    }
  }
}
