part of 'chat_cubit.dart';

sealed class ChatState {}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatSuccessState extends ChatState {
  final List<MessageModel> messages;

  ChatSuccessState({required this.messages});
}

class ChatErrorState extends ChatState {
  final String errorMessage;

  ChatErrorState({required this.errorMessage});
}
