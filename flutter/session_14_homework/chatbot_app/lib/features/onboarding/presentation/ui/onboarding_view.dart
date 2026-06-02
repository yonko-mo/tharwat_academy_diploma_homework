import 'package:chatbot_app/app_constants.dart';
import 'package:chatbot_app/core/constants/assets.dart';
import 'package:chatbot_app/core/shared_preferences_singleton.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:chatbot_app/core/widgets/custom_button.dart';
import 'package:chatbot_app/features/chat/presentation/ui/chat_view.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text('Your AI Assistant', style: AppStyles.heading1),
              const SizedBox(height: 14),
              const Text(
                'Using this software,you can ask you\nquestions and receive articles using\nartificial intelligence assistant',
                textAlign: TextAlign.center,
                style: AppStyles.heading2,
              ),
              const SizedBox(height: 84),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Image.asset(Assets.onboardingFrame),
              ),
              const Spacer(),
              CustomButton(
                text: 'Continue',
                withArrow: true,
                onPressed: () {
                   SharedPreferencesSingleton.instance.setBool(AppConstants.onboardingSeen, true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatView()),
                  );
                },
              ),
              const SizedBox(height: 34),
            ],
          ),
        ),
      ),
    );
  }
}
