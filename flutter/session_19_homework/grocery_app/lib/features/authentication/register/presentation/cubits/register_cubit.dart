import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/authentication/data/repos/auth_repository.dart';
import 'package:grocery_app/features/authentication/register/presentation/cubits/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(RegisterInitialState());

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoadingState());
    try {
      await _authRepository.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      emit(RegisterSuccessState('$firstName $lastName'));
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }
}
