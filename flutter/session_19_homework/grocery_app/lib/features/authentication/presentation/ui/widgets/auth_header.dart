import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;

  const AuthHeader({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.authHeaderStyle),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.close, color: Colors.white, size: 28),
          ),
        ),
      ],
    );
  }
}
