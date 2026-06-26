import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/authentication/login/presentation/cubits/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> signIn(String email, String password) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginError('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginError('Wrong password provided for that user.'));
      } else {
        emit(LoginError(e.message ?? 'Authentication failed.'));
      }
    } catch (e) {
      emit(LoginError('Something went wrong. Please try again.'));
    }
  }
}
