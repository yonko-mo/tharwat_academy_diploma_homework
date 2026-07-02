import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/errors/custom_exception.dart';
import 'package:grocery_app/features/authentication/domain/models/user_model.dart';
import 'package:grocery_app/features/authentication/domain/repos/auth_repo.dart';
import 'package:grocery_app/features/authentication/create_account/presentation/cubits/create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final AuthRepo _authRepo;

  CreateAccountCubit({required this._authRepo})
    : super(CreateAccountInitialState());

  Future<void> createAccount({
    required UserModel user,
    required String password,
  }) async {
    emit(CreateAccountLoadingState());
    try {
      await _authRepo.createAccount(user: user, password: password);
      emit(CreateAccountSuccessState('${user.firstName} ${user.lastName}'));
    } on CustomException catch (e) {
      emit(CreateAccountErrorState(e.message));
    }
  }
}
