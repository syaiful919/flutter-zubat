import 'package:flutter/material.dart';

class ElementTypeChip extends StatelessWidget {
  final Color backgroundColor;
  final String name;

  const ElementTypeChip({
    super.key,
    required this.backgroundColor,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
