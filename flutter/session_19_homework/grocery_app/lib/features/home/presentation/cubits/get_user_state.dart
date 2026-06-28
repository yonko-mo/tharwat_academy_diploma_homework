abstract class GetUserState {}

class GetUserInitialState extends GetUserState {}

class GetUserLoadingState extends GetUserState {}

class GetUserLoadedState extends GetUserState {
  final String firstName;
  final String lastName;
  GetUserLoadedState({required this.firstName, required this.lastName});
}

class GetUserErrorState extends GetUserState {
  final String message;
  GetUserErrorState(this.message);
}
