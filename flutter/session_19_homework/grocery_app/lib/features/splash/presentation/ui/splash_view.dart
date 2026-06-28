import 'package:flutter/material.dart';
import 'package:grocery_app/app_constants.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/core/shared_preferences_singleton.dart';
import 'package:grocery_app/core/theme/app_colors.dart';
import 'package:grocery_app/features/home/presentation/ui/home_view.dart';
import 'package:grocery_app/features/authentication/login/presentation/ui/login_view.dart';
import 'package:grocery_app/features/onboarding/presentation/ui/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  void executeNavigation() {
    final bool hasSeenOnboarding =
        SharedPreferencesSingleton.instance.getBool(
          AppConstants.onboardingSeen,
        ) ??
        false;

    final authService = FirebaseAuthService();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      if (!hasSeenOnboarding) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingView(),
          ),
        );
      } else {
        final user = authService.currentUser;
        if (user != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeView(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const LoginView(),
            ),
          );
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(
          Assets.assetsImagesPngsLogoIcon,
          width: MediaQuery.sizeOf(context).width * 0.55,
        ),
      ),
    );
  }
}

