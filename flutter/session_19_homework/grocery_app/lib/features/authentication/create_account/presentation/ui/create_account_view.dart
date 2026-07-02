import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:grocery_app/app_constants.dart';
import 'package:grocery_app/core/shared_preferences_singleton.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/features/authentication/data/repos/firebase_auth_repo.dart';
import 'package:grocery_app/features/authentication/create_account/presentation/cubits/create_account_cubit.dart';
import 'package:grocery_app/features/authentication/create_account/presentation/cubits/create_account_state.dart';
import 'package:grocery_app/features/authentication/create_account/presentation/ui/widgets/registration_success_dialog.dart';
import 'package:grocery_app/features/authentication/create_account/presentation/ui/widgets/create_account_bottom_sheet.dart';
import 'package:grocery_app/features/authentication/widgets/auth_background.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountCubit(authRepo: FirebaseAuthRepo()),
      child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
        listener: (context, state) {
          if (state is CreateAccountSuccessState) {
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
          } else if (state is CreateAccountErrorState) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                const AuthBackground(
                  imagePath: Assets.assetsImagesPngsRegisterImage,
                ),
                ModalProgressHUD(
                  inAsyncCall: state is CreateAccountLoadingState,
                  child: Positioned(
                    top: MediaQuery.sizeOf(context).height * 0.35,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: const CreateAccountBottomSheet(),
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
