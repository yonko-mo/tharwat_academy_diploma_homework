import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/core/services/firestore_service.dart';
import 'package:grocery_app/core/theme/app_colors.dart';
import 'package:grocery_app/features/authentication/domain/models/user_model.dart';
import 'package:grocery_app/features/home/presentation/ui/home_view.dart';
import 'package:grocery_app/features/onboarding/presentation/ui/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _authService = FirebaseAuthService();
  final _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  Future<void> executeNavigation() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    if (_authService.isLoggedIn()) {
      UserModel? user;
      final uid = _authService.getUid();
      if (uid != null) {
        final data = await _firestoreService.getDocument(
          collectionPath: 'users',
          documentId: uid,
        );
        if (data != null) user = UserModel.fromJson(data);
      }

      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeView(user: user)),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    }
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
