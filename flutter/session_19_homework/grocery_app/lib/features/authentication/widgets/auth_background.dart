import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final String imagePath;

  const AuthBackground({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: MediaQuery.sizeOf(context).height * 0.4,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Positioned(
          top: 48,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
