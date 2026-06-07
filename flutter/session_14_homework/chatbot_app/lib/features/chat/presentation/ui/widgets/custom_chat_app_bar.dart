import 'package:chatbot_app/core/constants/assets.dart';
import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 17.0),
        child: Row(
          children: [
            Image.asset(Assets.blueRobotIcon, width: 24, height: 36),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gemini',
                  style: AppStyles.heading1.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const ShapeDecoration(
                        color: AppColors.statusColor,
                        shape: OvalBorder(),
                      ),
                    ),
                    const SizedBox(width: 8.5),
                    Text(
                      'Online',
                      style: AppStyles.heading2.copyWith(
                        fontSize: 17,
                        color: AppColors.statusColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
