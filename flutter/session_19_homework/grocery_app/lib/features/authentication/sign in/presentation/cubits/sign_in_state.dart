import 'package:grocery_app/features/authentication/domain/models/user_model.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final UserModel user;
  SignInSuccessState(this.user);
}

class SignInErrorState extends SignInState {
  final String message;
  SignInErrorState(this.message);
}
