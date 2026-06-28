import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/app_constants.dart';
import 'package:grocery_app/core/shared_preferences_singleton.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/core/services/firestore_service.dart';
import 'package:grocery_app/features/authentication/data/repos/auth_repository.dart';
import 'package:grocery_app/features/authentication/login/presentation/cubits/login_cubit.dart';
import 'package:grocery_app/features/authentication/login/presentation/cubits/login_state.dart';
import 'package:grocery_app/features/authentication/login/presentation/ui/widgets/login_form.dart';
import 'package:grocery_app/features/authentication/widgets/auth_background.dart';
import 'package:grocery_app/features/home/presentation/ui/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        AuthRepository(
          authService: FirebaseAuthService(),
          firestoreService: FirestoreService(),
        ),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            SharedPreferencesSingleton.instance.setBool(
              AppConstants.onboardingSeen,
              true,
            );
            showSnackBar(context, 'login success');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          } else if (state is LoginErrorState) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                AuthBackground(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  onBack: () => Navigator.of(context).pop(),
                  imagePath: Assets.assetsImagesPngsSigninImage,
                ),
                Positioned(
                  top: MediaQuery.sizeOf(context).height * 0.35,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 29.0,
                        vertical: 37.0,
                      ),
                      child: LoginForm(state: state),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
