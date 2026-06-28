import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/authentication/data/repos/auth_repository.dart';
import 'package:grocery_app/features/authentication/login/presentation/cubits/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginInitial());

  final AuthRepository _authRepository;

  Future<void> signIn(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await _authRepository.login(email: email, password: password);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
