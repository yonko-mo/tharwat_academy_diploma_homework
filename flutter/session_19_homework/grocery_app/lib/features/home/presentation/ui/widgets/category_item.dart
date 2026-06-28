import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  const CategoryItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.245,
      decoration: ShapeDecoration(
        shadows: const [
          BoxShadow(
            color: Color(0xFFFAFAFA),
            blurRadius: 19,
            offset: Offset(9, 0),
            spreadRadius: 2,
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }
}
