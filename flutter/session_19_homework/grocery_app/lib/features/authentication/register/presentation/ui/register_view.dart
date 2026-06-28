import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/app_constants.dart';
import 'package:grocery_app/core/shared_preferences_singleton.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/core/services/firestore_service.dart';
import 'package:grocery_app/features/authentication/data/repos/auth_repository.dart';
import 'package:grocery_app/features/authentication/register/presentation/cubits/register_cubit.dart';
import 'package:grocery_app/features/authentication/register/presentation/cubits/register_state.dart';
import 'package:grocery_app/features/authentication/register/presentation/ui/widgets/registration_success_dialog.dart';
import 'package:grocery_app/features/authentication/register/presentation/ui/widgets/register_form.dart';
import 'package:grocery_app/features/authentication/widgets/auth_background.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuthBackground(
            height: MediaQuery.sizeOf(context).height * 0.4,
            onBack: () => Navigator.of(context).pop(),
            imagePath: Assets.assetsImagesPngsRegisterImage,
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
                child: BlocProvider(
                  create: (context) => RegisterCubit(
                    AuthRepository(
                      authService: FirebaseAuthService(),
                      firestoreService: FirestoreService(),
                    ),
                  ),
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccessState) {
                        SharedPreferencesSingleton.instance.setBool(
                          AppConstants.onboardingSeen,
                          true,
                        );
                        showSnackBar(context, 'registration success');
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) =>
                              RegistrationSuccessDialog(userName: state.userName),
                        );
                      } else if (state is RegisterErrorState) {
                        showSnackBar(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      return RegisterForm(state: state);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
