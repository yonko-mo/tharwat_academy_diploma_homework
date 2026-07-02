import 'package:flutter/material.dart';
import 'package:grocery_app/core/widgets/custom_elevated_button.dart';
import 'package:grocery_app/features/authentication/domain/models/user_model.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/ads_list_view.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/category_section.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/section_header.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/trending_deals_grid_view.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/home_header.dart';

class HomeView extends StatelessWidget {
  final UserModel? user;

  const HomeView({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(user: user),
                const AdsListView(),
                const SizedBox(height: 30),
                const CategorySection(),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: SectionHeader(
                        title: 'Trending Deals',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 13),
                const Padding(
                  padding: EdgeInsets.only(right: 28.0),
                  child: TrendingDealsGridView(),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: CustomElevatedButton(
                    text: 'More',
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
