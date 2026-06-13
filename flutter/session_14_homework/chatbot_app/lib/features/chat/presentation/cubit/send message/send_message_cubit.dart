import 'package:chatbot_app/core/network/custom_exceptions.dart';
import 'package:chatbot_app/features/chat/data/repos/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbot_app/features/chat/data/models/content_model.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(SendMessageInitialState());
  final ChatRepo chatRepo = ChatRepo();

  final List<ContentModel> messages = [];

  Future<void> sendMessage(List<ContentModel> messages) async {
    emit(SendMessageLoadingState(messages: List.from(messages)));
    try {
      ContentModel response = await chatRepo.sendMessage(messages);
      this.messages.add(response);
      emit(SendMessageSuccessState(messages: List.from(this.messages)));
    } on ApiException catch (e) {
      this.messages.removeLast();
      emit(SendMessageFailureState(errorMessage: e.message));
    }
  }
}
