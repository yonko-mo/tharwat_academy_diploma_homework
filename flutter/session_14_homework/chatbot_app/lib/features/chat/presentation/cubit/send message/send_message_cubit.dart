import 'package:chatbot_app/features/chat/data/repos/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbot_app/features/chat/data/models/content_model.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(SendMessageInitialState());
  final ChatRepo chatRepo = ChatRepo();

  final List<ContentModel> messages = [];

  Future<void> sendMessage(String text) async {
    final userMessage = ContentModel.fromUser(text);
    messages.add(userMessage);

    emit(SendMessageLoadingState());

    try {
      ContentModel botResponse = await chatRepo.sendMessage(messages);

      messages.add(botResponse);

      emit(SendMessageSuccessState());
    } catch (e) {
      messages.removeLast();
      emit(SendMessageFailureState(errorMessage: e.toString()));
    }
  }
}
