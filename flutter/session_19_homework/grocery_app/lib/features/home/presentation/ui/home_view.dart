import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/core/services/firestore_service.dart';
import 'package:grocery_app/features/home/data/repos/home_repository.dart';
import 'package:grocery_app/core/theme/app_styles.dart';
import 'package:grocery_app/features/home/presentation/cubits/home_cubit.dart';
import 'package:grocery_app/features/home/presentation/cubits/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        HomeRepository(
          authService: FirebaseAuthService(),
          firestoreService: FirestoreService(),
        ),
      )..loadUserData(),

      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Good Morning',
                        style: AppStyles.homeGoodMorningStyle,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${state.firstName} ${state.lastName}',
                        style: AppStyles.homeUserNameStyle,
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
