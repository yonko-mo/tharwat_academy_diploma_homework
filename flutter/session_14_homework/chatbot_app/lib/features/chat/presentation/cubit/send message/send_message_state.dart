part of 'send_message_cubit.dart';

sealed class SendMessageState {}

class SendMessageInitialState extends SendMessageState {}

class SendMessageLoadingState extends SendMessageState {}

class SendMessageSuccessState extends SendMessageState {}

class SendMessageFailureState extends SendMessageState {
  final String errorMessage;

  SendMessageFailureState({required this.errorMessage});
}
