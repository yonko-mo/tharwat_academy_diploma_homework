import 'dart:math' as math;
import 'package:chatbot_app/core/constants/assets.dart';
import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChatbotLoadingBubble extends StatefulWidget {
  const ChatbotLoadingBubble({super.key});

  @override
  State<ChatbotLoadingBubble> createState() => _ChatbotLoadingBubbleState();
}

class _ChatbotLoadingBubbleState extends State<ChatbotLoadingBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(245.28),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 1.96,
                offset: Offset(0, 1.96),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4.91,
            children: [
              Container(
                width: 11.77,
                height: 17.66,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.blueRobotIcon),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 7),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const ShapeDecoration(
              color: AppColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final double animationVal = math.sin(
                      (_controller.value * 2 * math.pi) -
                          (index * math.pi / 3),
                    );
                    final double yOffset =
                        (animationVal < 0 ? animationVal : 0) * 6.0;

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 6,
                      height: 6,
                      transform: Matrix4.translationValues(0, yOffset, 0),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
