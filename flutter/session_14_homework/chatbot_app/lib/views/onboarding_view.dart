import 'package:chatbot_app/constants/assets.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/constants/text_styles.dart';
import 'package:chatbot_app/views/chat_view.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Your AI Assistant', style: AppTextStyles.heading1),
            const SizedBox(height: 14),
            const Text(
              'Using this software,you can ask you\nquestions and receive articles using\nartificial intelligence assistant',
              textAlign: TextAlign.center,
              style: AppTextStyles.heading2,
            ),
            const SizedBox(height: 84),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 27.0),
              child: Image.asset(Assets.onboardingFrame),
            ),
            const SizedBox(height: 130),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Text(
                    'Continue',
                    style: AppTextStyles.heading1.copyWith(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatView(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
