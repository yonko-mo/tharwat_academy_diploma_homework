part of 'send_message_cubit.dart';

sealed class SendMessageState {}

class SendMessageInitialState extends SendMessageState {}

class SendMessageLoadingState extends SendMessageState {
  final List<ContentModel> messages;
  SendMessageLoadingState({required this.messages});
}

class SendMessageSuccessState extends SendMessageState {
  final List<ContentModel> messages;
  SendMessageSuccessState({required this.messages});
}

class SendMessageFailureState extends SendMessageState {
  final String errorMessage;
  SendMessageFailureState({required this.errorMessage});
}
