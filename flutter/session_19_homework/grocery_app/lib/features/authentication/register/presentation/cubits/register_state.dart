abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String userName;
  RegisterSuccess(this.userName);
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}
