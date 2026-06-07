import 'package:chatbot_app/features/chat/presentation/ui/widgets/chat_body.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chat_input_field.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/custom_chat_app_bar.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/initial_chat_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/send%20message/send_message_cubit.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

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
                    top: 30,
                    child: BlocConsumer<SendMessageCubit, SendMessageState>(
                      listener: (context, state) {
                        if (state is SendMessageFailureState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        final hasMessages =
                            context.read<SendMessageCubit>().messages.isNotEmpty;

                        if (!hasMessages && state is! SendMessageLoadingState) {
                          return const InitialChatBody();
                        }

                        return const ChatBody();
                      },
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(child: ChatInputField()),
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

