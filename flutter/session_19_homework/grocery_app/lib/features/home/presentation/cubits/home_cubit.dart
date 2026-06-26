import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/home/presentation/cubits/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> loadUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (doc.exists) {
          emit(HomeLoaded(
            firstName: doc.data()?['firstName'] ?? '',
            lastName: doc.data()?['lastName'] ?? '',
          ));
        } else {
          emit(HomeLoaded(firstName: '', lastName: ''));
        }
      }
    } catch (e) {
      emit(HomeError('Failed to load user data'));
    }
  }
}
