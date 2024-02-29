import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait(this.iconData, this.label, {super.key});

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 18,
          color: Colors.white,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
