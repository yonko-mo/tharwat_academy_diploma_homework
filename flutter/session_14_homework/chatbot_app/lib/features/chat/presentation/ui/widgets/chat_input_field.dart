import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:chatbot_app/features/chat/data/models/content_model.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/send%20message/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInputField extends StatefulWidget {
  final List<ContentModel> messages;
  const ChatInputField({super.key, required this.messages});

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
            onPressed: () {
              if (BlocProvider.of<SendMessageCubit>(context).state
                  is SendMessageFailureState) {
                widget.messages.removeLast();
              }
              var message = ContentModel.fromUser(_controller.text);
              widget.messages.add(message);
              BlocProvider.of<SendMessageCubit>(
                context,
              ).sendMessage(widget.messages);
              _controller.clear();
            },
            icon: const Icon(Icons.send, color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onSubmitted: (value) {
          var message = ContentModel.fromUser(value);
          widget.messages.add(message);
          BlocProvider.of<SendMessageCubit>(
            context,
          ).sendMessage(widget.messages);
          _controller.clear();
        },
      ),
    );
  }
}
