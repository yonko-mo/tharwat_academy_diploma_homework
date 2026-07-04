import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:grocery_app/app_constants.dart';
import 'package:grocery_app/core/shared_preferences_singleton.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/features/authentication/data/repos/firebase_auth_repo.dart';
import 'package:grocery_app/features/authentication/presentation/cubits/sign_in_cubit.dart';
import 'package:grocery_app/features/authentication/presentation/cubits/sign_in_state.dart';
import 'package:grocery_app/features/authentication/presentation/ui/widgets/sign_in_bottom_sheet.dart';
import 'package:grocery_app/features/authentication/presentation/ui/widgets/auth_background.dart';
import 'package:grocery_app/features/home/presentation/ui/home_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(authRepo: FirebaseAuthRepo()),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            SharedPreferencesSingleton.instance.setBool(
              AppConstants.onboardingSeen,
              true,
            );
            showSnackBar(context, 'login success');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeView(user: state.user),
              ),
            );
          } else if (state is SignInErrorState) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                const AuthBackground(
                  imagePath: Assets.assetsImagesPngsSigninImage,
                ),
                ModalProgressHUD(
                  inAsyncCall: state is SignInLoadingState,
                  child: Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 450 / 812 * MediaQuery.sizeOf(context).height,
                    child: const SignInBottomSheet(),
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
