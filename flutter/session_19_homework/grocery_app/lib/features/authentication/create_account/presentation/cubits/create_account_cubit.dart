import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/authentication/domain/repos/auth_repo.dart';
import 'package:grocery_app/features/authentication/create_account/presentation/cubits/create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final AuthRepo _authRepo;

  CreateAccountCubit({required this._authRepo})
    : super(CreateAccountInitialState());

  Future<void> createAccount({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(CreateAccountLoadingState());
    try {
      await _authRepo.createAccount(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      emit(CreateAccountSuccessState('$firstName $lastName'));
    } catch (e) {
      emit(CreateAccountErrorState(e.toString()));
    }
  }
}
