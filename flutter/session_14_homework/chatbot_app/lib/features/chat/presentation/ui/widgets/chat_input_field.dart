import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 29, right: 29),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x21000000),
              blurRadius: 20,
              offset: Offset(5, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          style: AppStyles.heading1.copyWith(
            fontSize: 13,
            color: AppColors.primaryColor,
          ),
          decoration: InputDecoration(
            hintText: 'Write your message',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                final message = _controller.text.trim();
                if (message.isEmpty) return;
                context.read<ChatCubit>().sendMessage(message);
                _controller.clear();
              },
              icon: const Icon(Icons.send, color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onSubmitted: (_) {
            final message = _controller.text.trim();
            if (message.isEmpty) return;
            context.read<ChatCubit>().sendMessage(message);
            _controller.clear();
          },
        ),
      ),
    );
  }
}
