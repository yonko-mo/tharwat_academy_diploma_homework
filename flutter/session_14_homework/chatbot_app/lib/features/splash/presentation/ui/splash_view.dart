import 'dart:async';

import 'package:chatbot_app/app_constants.dart';
import 'package:chatbot_app/core/constants/assets.dart';
import 'package:chatbot_app/core/shared_preferences_singleton.dart';
import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/features/chat/presentation/ui/chat_view.dart';
import 'package:chatbot_app/features/onboarding/presentation/ui/onboarding_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final Timer _timer;
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  void executeNavigation() {
    final bool value = SharedPreferencesSingleton.instance.getBool(AppConstants.onboardingSeen) ?? false;

    _timer = Timer(const Duration(seconds: 3), () {
      if (value == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const ChatView(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingView(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(
          Assets.splashImage,
          width: MediaQuery.sizeOf(context).width * 0.55,
        ),
      ),
    );
  }
}
