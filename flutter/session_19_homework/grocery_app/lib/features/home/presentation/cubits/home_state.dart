abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final String firstName;
  final String lastName;
  HomeLoaded({required this.firstName, required this.lastName});
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
