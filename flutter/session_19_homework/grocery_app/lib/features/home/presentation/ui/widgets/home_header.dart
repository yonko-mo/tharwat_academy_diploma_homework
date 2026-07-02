import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_styles.dart';
import 'package:grocery_app/features/authentication/domain/models/user_model.dart';

class HomeHeader extends StatelessWidget {
  final UserModel? user;

  const HomeHeader({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              user != null ? '${user!.firstName} ${user!.lastName}' : '',
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
    );
  }
}
