import 'package:chatbot_app/features/chat/data/models/content_model.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/send%20message/send_message_cubit.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chat_messages_failure_list_view.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chat_messages_list_view.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chat_messages_loading_list_view.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/initial_chat_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatViewBodyBlocConsumer extends StatefulWidget {
  final List<ContentModel> messages;
  const ChatViewBodyBlocConsumer({super.key, required this.messages});

  @override
  State<ChatViewBodyBlocConsumer> createState() =>
      _ChatViewBodyBlocConsumerState();
}

class _ChatViewBodyBlocConsumerState extends State<ChatViewBodyBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendMessageCubit, SendMessageState>(
      listener: (context, state) {
        if (state is SendMessageSuccessState) {
          widget.messages.add(state.message);
        }
      },
      builder: (context, state) {
        if (state is SendMessageInitialState) {
          return InitialChatBody(messages: widget.messages);
        } else if (state is SendMessageSuccessState) {
          return ChatMessagesListView(messages: widget.messages);
        } else if (state is SendMessageFailureState) {
          return ChatMessagesFailureListView(
            messages: widget.messages,
            errorMessage: state.errorMessage,
          );
        } else {
          return ChatMessagesLoadingListView(messages: widget.messages);
        }
      },
    );
  }
}
