import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:chatbot_app/features/chat/data/models/content_model.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/send%20message/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  late final TextEditingController _controller;

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

  void _send() {
    final message = _controller.text.trim();
    if (message.isEmpty) return;

    final cubit = context.read<SendMessageCubit>();
    cubit.messages.add(ContentModel.fromUser(message));
    cubit.sendMessage(cubit.messages);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
        maxLines: 1,
        controller: _controller,
        style: AppStyles.textFieldHintStyle,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Write your message',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: IconButton(
            onPressed: _send,
            icon: const Icon(Icons.send, color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onSubmitted: (_) => _send(),
      ),
    );
  }
}
