abstract class CreateAccountState {}

class CreateAccountInitialState extends CreateAccountState {}

class CreateAccountLoadingState extends CreateAccountState {}

class CreateAccountSuccessState extends CreateAccountState {
  final String userName;
  CreateAccountSuccessState(this.userName);
}

class CreateAccountErrorState extends CreateAccountState {
  final String message;
  CreateAccountErrorState(this.message);
}
