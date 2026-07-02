import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/errors/custom_exception.dart';
import 'package:grocery_app/features/authentication/domain/repos/auth_repo.dart';
import 'package:grocery_app/features/authentication/sign in/presentation/cubits/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signIn(String email, String password) async {
    emit(SignInLoadingState());
    try {
      final user = await authRepo.signIn(email: email, password: password);
      emit(SignInSuccessState(user!));
    } on CustomException catch (e) {
      emit(SignInErrorState(e.message));
    }
  }
}
