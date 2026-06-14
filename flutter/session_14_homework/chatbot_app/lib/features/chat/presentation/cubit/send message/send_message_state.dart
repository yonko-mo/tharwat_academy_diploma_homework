part of 'send_message_cubit.dart';

sealed class SendMessageState {}

class SendMessageInitialState extends SendMessageState {}

class SendMessageLoadingState extends SendMessageState {
  SendMessageLoadingState();
}

class SendMessageSuccessState extends SendMessageState {
  final ContentModel message;
  SendMessageSuccessState({required this.message});
}

class SendMessageFailureState extends SendMessageState {
  final String errorMessage;
  SendMessageFailureState({required this.errorMessage});
}
