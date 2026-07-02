import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/home/data/repos/home_repository.dart';
import 'package:grocery_app/features/home/presentation/cubits/get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  final HomeRepository _homeRepository;

  GetUserCubit(this._homeRepository) : super(GetUserInitialState());

  Future<void> loadUserData() async {
    emit(GetUserLoadingState());
    try {
      final profile = await _homeRepository.getUserProfile();
      emit(GetUserLoadedState(
        firstName: profile.firstName,
        lastName: profile.lastName,
      ));
    } catch (e) {
      emit(GetUserErrorState(e.toString()));
    }
  }
}
