import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TextShimmer extends StatelessWidget {
  final double width;
  final double height;

  const TextShimmer({
    super.key,
    this.width = 100,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(0.2),
      highlightColor: Colors.black.withOpacity(0.3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        height: height,
        width: width,
      ),
    );
  }
}
