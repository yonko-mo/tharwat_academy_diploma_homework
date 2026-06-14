import 'package:chatbot_app/core/network/custom_exceptions.dart';
import 'package:chatbot_app/features/chat/data/repos/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbot_app/features/chat/data/models/content_model.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(SendMessageInitialState());
  final ChatRepo chatRepo = ChatRepo();

  Future<void> sendMessage(List<ContentModel> messages) async {
    emit(SendMessageLoadingState());
    try {
      var message = await chatRepo.sendMessage(messages);
      emit(SendMessageSuccessState(message: message));
    } on ApiException catch (e) {
      emit(SendMessageFailureState(errorMessage: e.message));
    }
  }
}
