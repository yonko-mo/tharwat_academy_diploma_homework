import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:grocery_app/core/constants/assets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFF1F1F5),
            width: 1,
          ),
        ),
      ),
      child: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedColor: const Color(0xFFF2994A),
        unSelectedColor: const Color(0xFFB5B5BE),
        iconSize: 28,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.swap_horiz),
          ),
          CustomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart),
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFC107),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.favorite),
          ),
          CustomNavigationBarItem(
            icon: const CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage(
                Assets.assetsImagesPngsProfilePlaceholder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
