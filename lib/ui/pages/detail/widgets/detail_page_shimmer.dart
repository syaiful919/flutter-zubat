import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'text_shimmer.dart';

class DetailPageShimmer extends StatelessWidget {
  const DetailPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.black.withOpacity(0.2),
            highlightColor: Colors.black.withOpacity(0.3),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.white,
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.black.withOpacity(0.2),
                  highlightColor: Colors.black.withOpacity(0.3),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: 30,
                    width: MediaQuery.sizeOf(context).width * 0.75,
                  ),
                ),
                const SizedBox(height: 12),
                TextShimmer(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                ),
                const SizedBox(height: 12),
                TextShimmer(
                  width: MediaQuery.sizeOf(context).width * 0.35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
