import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/authentication/domain/repos/auth_repo.dart';
import 'package:grocery_app/features/authentication/sign%20in/presentation/cubits/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signIn(String email, String password) async {
    emit(SignInLoadingState());
    try {
      await authRepo.signIn(email: email, password: password);
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInErrorState(e.toString()));
    }
  }
}
