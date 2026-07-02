import 'package:flutter/material.dart';
import 'package:grocery_app/core/widgets/custom_elevated_button.dart';
import 'package:grocery_app/core/theme/app_styles.dart';
import 'package:grocery_app/features/authentication/domain/models/user_model.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/ads_list_view.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/category_section.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/section_header.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/trending_deals_grid_view.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/custom_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  final UserModel? user;

  const HomeView({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(left: 28, right: 28),
              sliver: SliverToBoxAdapter(
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
                        Text(
                          user != null
                              ? '${user!.firstName} ${user!.lastName}'
                              : '',
                          style: AppStyles.homeUserNameStyle,
                        ),
                        const Spacer(),
                        const Stack(
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
                      ],
                    ),
                    const SizedBox(height: 23),
                  ],
                ),
              ),
            ),

            const SliverPadding(
              padding: EdgeInsets.only(left: 28),
              sliver: SliverToBoxAdapter(child: AdsListView()),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 30)),

            const SliverPadding(
              padding: EdgeInsets.only(left: 28),
              sliver: SliverToBoxAdapter(child: CategorySection()),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 30)),

            SliverPadding(
              padding: const EdgeInsets.only(left: 28),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(title: 'Trending Deals', onPressed: () {}),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 13)),

            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              sliver: TrendingDealsGridView(),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 40,
                ),
                child: CustomElevatedButton(
                  text: 'More',
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
