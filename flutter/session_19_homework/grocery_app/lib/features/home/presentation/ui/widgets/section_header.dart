import 'package:flutter/material.dart';

import 'package:grocery_app/core/theme/app_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const SectionHeader({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.sectionHeaderStyle,
        ),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_forward_rounded,
            color: Color(0xFF171725),
            size: 24,
          ),
        ),
      ],
    );
  }
}
