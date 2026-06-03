import 'package:chatbot_app/features/chat/presentation/ui/widgets/chatbot_answer.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/user_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/chat_cubit.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final cubit = context.read<ChatCubit>();

        return ListView.builder(
          itemCount: state is ChatLoadingState || state is ChatErrorState
              ? cubit.messages.length + 1
              : cubit.messages.length,
          itemBuilder: (context, index) {
            if (state is ChatLoadingState && index == cubit.messages.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  children: [
                    CircularProgressIndicator(strokeWidth: 2),
                    SizedBox(width: 12),
                    Text('Gemini is typing...'),
                  ],
                ),
              );
            }

            if (state is ChatErrorState && index == cubit.messages.length) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Error',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        (state).errorMessage,
                        style: TextStyle(color: Colors.red.shade700),
                      ),
                    ],
                  ),
                ),
              );
            }

            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: cubit.messages[index].isUserMessage
                    ? UserQuestion(question: cubit.messages[index].message)
                    : ChatbotAnswer(answer: cubit.messages[index].message),
              ),
            );
          },
        );
      },
    );
  }
}
