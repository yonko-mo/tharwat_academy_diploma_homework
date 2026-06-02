import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(color: Color(0x0C000000), blurRadius: 1.96),
        ],
      ),
      child: TextField(
        style: AppStyles.heading1.copyWith(
          fontSize: 13,
          color: AppColors.primaryColor,
        ),
        decoration: InputDecoration(
          hintText: 'Write your message',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: (Colors.white)),
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send, color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
