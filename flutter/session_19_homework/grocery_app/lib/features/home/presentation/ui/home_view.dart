import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/core/services/firestore_service.dart';
import 'package:grocery_app/features/home/data/repos/home_repository.dart';
import 'package:grocery_app/core/theme/app_styles.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/features/home/presentation/cubits/get_user_cubit.dart';
import 'package:grocery_app/features/home/presentation/cubits/get_user_state.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/ads_list_view.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/section_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserCubit(
        HomeRepository(
          authService: FirebaseAuthService(),
          firestoreService: FirestoreService(),
        ),
      )..loadUserData(),

      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Good Morning',
                  style: AppStyles.homeGoodMorningStyle,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    BlocConsumer<GetUserCubit, GetUserState>(
                      listener: (context, state) {
                        if (state is GetUserErrorState) {
                          showSnackBar(context, state.message);
                        }
                      },
                      builder: (context, state) {
                        if (state is GetUserLoadedState) {
                          return Text(
                            '${state.firstName} ${state.lastName}',
                            style: AppStyles.homeUserNameStyle,
                          );
                        } else {
                          return const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.grey,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const Spacer(),
                    const Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Color(0xFF171725),
                          size: 24,
                        ),
                        Positioned(
                          right: 1,
                          top: 1,
                          child: Icon(
                            Icons.circle,
                            size: 10,
                            color: Color(0xFFFFC107),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
                const SizedBox(height: 23),
                const AdsListView(),
                const SizedBox(height: 30),
                const CategorySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SectionHeader(title: 'Categories', onPressed: () {})],
    );
  }
}
