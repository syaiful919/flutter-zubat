import 'package:flutter/material.dart';
import 'package:zubat/models/gender_percentage.dart';

class GenderBar extends StatelessWidget {
  final GenderPercentage percentage;

  const GenderBar({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 16,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                Expanded(
                  flex: percentage.male.floor(),
                  child: Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                  ),
                ),
                Expanded(
                  flex: percentage.female.ceil(),
                  child: Container(
                    color: Colors.pink,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.male,
                  size: 16,
                ),
                Text("${percentage.male.floor()}% male"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.female,
                  size: 16,
                ),
                Text("${percentage.female.ceil()}% female"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
