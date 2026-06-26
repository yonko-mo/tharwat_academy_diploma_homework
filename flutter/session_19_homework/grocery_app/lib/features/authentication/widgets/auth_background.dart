import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final double height;
  final VoidCallback onBack;
  final String imagePath;

  const AuthBackground({
    super.key,
    required this.height,
    required this.onBack,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: height,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: MediaQuery.paddingOf(context).top + 12,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: onBack,
          ),
        ),
      ],
    );
  }
}
