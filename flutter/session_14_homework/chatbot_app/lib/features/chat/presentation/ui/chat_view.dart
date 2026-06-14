import 'package:chatbot_app/features/chat/data/models/content_model.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chat_input_field.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chat_view_body_bloc_consumer.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/custom_chat_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/send%20message/send_message_cubit.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<ContentModel> messages = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendMessageCubit(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: const CustomChatAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SafeArea(
              top: false,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ChatViewBodyBlocConsumer(messages: messages),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(child: ChatInputField(messages: messages)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
