import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/home/data/repos/home_repository.dart';
import 'package:grocery_app/features/home/presentation/cubits/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitial());

  Future<void> loadUserData() async {
    try {
      final profile = await _homeRepository.getUserProfile();
      emit(HomeLoaded(
        firstName: profile['firstName'] ?? '',
        lastName: profile['lastName'] ?? '',
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}

